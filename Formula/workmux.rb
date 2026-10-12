class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.275"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.275/workmux-darwin-arm64.tar.gz"
      sha256 "ba8248ecfe1d57d73e25ee127386a663237510af176005925d604778b43ad8f2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.275/workmux-darwin-amd64.tar.gz"
      sha256 "da4849be24e6cd2fe15501c578876d1c90f0a267e382d838122c956cf7e7d38c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.275/workmux-linux-arm64.tar.gz"
      sha256 "bf25350ddc014586afcdf25cb8d0f8fb7dc2990491c07298614af632c5828059"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.275/workmux-linux-amd64.tar.gz"
      sha256 "4d07bf88699c476d400767d5b3f88c5361f25908facf4cd8bf954fcb8fe462ea"
    end
  end

  def install
    bin.install "workmux"
    generate_completions_from_executable(bin/"workmux", "completions")
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
