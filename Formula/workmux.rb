class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.137"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.137/workmux-darwin-arm64.tar.gz"
      sha256 "1d40bcd138aad5cfbac0f8f7657fe73c45dcfed8301c021a10767993ec07c983"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.137/workmux-darwin-amd64.tar.gz"
      sha256 "34ff4d4d14103a9882da25739a21f3a35bb39c8a4c9472b9171cff3fd56d959c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.137/workmux-linux-arm64.tar.gz"
      sha256 "866738a188668616d8ae24ee503af2458a6467b97b33e7b4d9676ec6ef952805"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.137/workmux-linux-amd64.tar.gz"
      sha256 "c61bd7f8e85db755e2ae7e361c82a6d394cebae57dd7cc2cd57918a98de79dfe"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
