class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.261"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.261/workmux-darwin-arm64.tar.gz"
      sha256 "1794e796f7c636af9b9caad6b3119163aedab29bf640ace34f13f1311e89fa9c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.261/workmux-darwin-amd64.tar.gz"
      sha256 "c35551456a66aa3f4513bc4063876a37ea3617341b9ef392e5414eb0d2003ae5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.261/workmux-linux-arm64.tar.gz"
      sha256 "a7a5939b3fb173c6ce95d9a6757ea549c9769c2dea0412b3d34795b0d6547ea3"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.261/workmux-linux-amd64.tar.gz"
      sha256 "87a8108a49c8064107e4e55060637d0e94fa40ac8ed29f64dfce0a64c5e05dc8"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
