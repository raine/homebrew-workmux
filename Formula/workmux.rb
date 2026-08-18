class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.240"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.240/workmux-darwin-arm64.tar.gz"
      sha256 "bcf97ab8884ac8ce8c1a540584a357b680da0fa06a85f5cce55b7c0f0178df15"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.240/workmux-darwin-amd64.tar.gz"
      sha256 "9015e00701cfa7c4abe429e9ca32c4c559cb969fa118e69508409f519ebc91cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.240/workmux-linux-arm64.tar.gz"
      sha256 "d33efcafc43648a53bbe3daf948dab4b8e5d5b40f8a209867ddf578a7919cbe1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.240/workmux-linux-amd64.tar.gz"
      sha256 "40fdcfd944e6bf35c0b9e68eca0f33d45bae6bf99b5d6cdb0d677770d56fd9e0"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
