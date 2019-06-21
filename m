Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 605894E6EB
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 13:16:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VbjC3sshzDqdv
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 21:16:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SjRYDV0M"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Vbhv4vTzzDqcV
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 21:15:59 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id p184so3437743pfp.7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6Dz4Z+dmuRUi0NOnymZGvWj/MoeH9WQhV7Y+qJ24/00=;
 b=SjRYDV0MkGpoVQrf6DKrSzISHxIt8y/kiuPlX5j3sK09B6aAzHi5CxPUXhs3+l4edL
 BXNIVe4XRBry5jx6zib7eLlg495Ku11/2Hskk6W0FNs+JksUHNUK782wGrQ/3urknmHC
 wMh0GL+DxFVt0sHutVHNzW2V6lh8jlsyy43fKe5AyJZWk4y8Y9yTwGofLgX2vFVMVPft
 TCBCdfDB6Bk8vUj/wDkAdzUj7R9o4pSVAvPu/io/VJfSskVoM78a+4dDBDTgTIQ7cRTg
 DCbnw/3wcDwcgI6cvTsXs5JKQaYOnPI9wEWrC9pO9roSEnnPHpqfy9F+f+XVVNamCae+
 wT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6Dz4Z+dmuRUi0NOnymZGvWj/MoeH9WQhV7Y+qJ24/00=;
 b=mFrIgIBssm3Mau6ruj71DS8L+ZTu9Po2XPa2gTCl6LAZdW/+hsZ85p8B6IxFxJE1xY
 3pbE88EYRQkvc/BpQAz/zhBjjgHlNEntzzU25FK6uezeSEE3aavavvJd0YXEtHq9evLw
 4oouVz9aekRAmUptbpPvnfU5Ws8/ndhFlxPGk14Sj+kP1y23FzvoG5u51lx97JHDrDlD
 /y2GeS0UO7pHBvBtSP6Yn60eDd4B4V0p8rFgAJRjwX3Tk7KkNoZ+1H8F/bRuAFpouwXg
 CIEmmC82CN2wePRbLWWB82dnXoFZMdamCEAVbtkRwoaWWcCF/zhqACSFg8RfjjX/VG83
 xA2A==
X-Gm-Message-State: APjAAAWoljZpJupeFc2/a0rqVO5UTlzmw6+dPCkxH84ICeiFSRkf+MZZ
 MDcDhhkTy6XqJMlCKtrXwyk=
X-Google-Smtp-Source: APXvYqxb6mOFj/WG4GMZNsDDWZmPushL+3w5hnh8g2Y4/W0ZvCeDMNUmpcLN/zUJCAeyvoIW3mmUFQ==
X-Received: by 2002:a65:4383:: with SMTP id m3mr17452043pgp.435.1561115755503; 
 Fri, 21 Jun 2019 04:15:55 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id w4sm2405737pfw.97.2019.06.21.04.15.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Jun 2019 04:15:54 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 shivahshankar@gmail.com, sudheer.veliseti@aspeedtech.com
Subject: [patch 0/5] *** DMA based UART driver for AST2500 ***
Date: Fri, 21 Jun 2019 16:47:30 +0530
Message-Id: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 sudheer veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: sudheer veliseti <sudheer.open@gmail.com>

Hi,
AST2500 has dedicated Uart DMA controller which has 12 sets of
Tx and RX channels connected to UART controller directly.
Since the DMA controller have dedicated buffers and registers,
there would be little benifit in adding DMA framework overhead.
So the software for DMA controller is included within the UART driver itself.

Thanks and Regards
Sudheer.V

sudheer veliseti (5):
  AST2500 DMA UART driver
  build configuration for AST2500 DMA UART driver
  DT nodes for AST2500 DMA UART driver
  defconfig and MAINTAINERS updated for AST2500 DMA UART driver
  Documentation: DT bindings AST2500 DMA UART driver

 .../bindings/serial/ast2500-dma-uart.txt      |   40 +
 MAINTAINERS                                   |   13 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts      |   21 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |   71 +-
 arch/arm/configs/aspeed_g5_defconfig          |    1 +
 .../tty/serial/8250/8250_ast2500_uart_dma.c   | 1879 +++++++++++++++++
 drivers/tty/serial/8250/Kconfig               |   35 +-
 drivers/tty/serial/8250/Makefile              |    1 +
 8 files changed, 2056 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
 create mode 100644 drivers/tty/serial/8250/8250_ast2500_uart_dma.c

-- 
2.17.1


