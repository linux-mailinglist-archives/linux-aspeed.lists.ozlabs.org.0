Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 343DE7675F
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:25:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45w8wb044PzDqQR
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 23:25:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jOU3G58i"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45w8w9036MzDqQG
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 23:25:23 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id c3so1397523pfa.13
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 06:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ouOMj6cpN1ep3ajODfqH/x6C/iWcdYxWbD9mvS45xHg=;
 b=jOU3G58iAy4awdh8qWndAXBO2fOOApa5MMp6QlU+ldAXdH4LL2P+HvGVeh3GHywN12
 zMONN3mo8xUwLuP1Zlxhh2HI8eza6Volc1KIK+eFJIKPtMbE8surYZAPx8r8xkbWfY3m
 39z4iXzwzyHP0nzfLQwSZZtZiMuLoS3K9CfemqBaNroo/M4U6B32eMZaDp9L3s0TUcZ1
 vDz7k0LZAn8U8G15ayoGp5ObNQgH2zSG/REXT0qvF/exAuzmORZf9f8wYS/OwiCw998d
 jxyiciXSgbFPwggylGS2TJQkFXgd2tMLlSdMxZl+U1hhuRNlQ/7CYE+nN8Yy4r0Bzu0b
 uDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ouOMj6cpN1ep3ajODfqH/x6C/iWcdYxWbD9mvS45xHg=;
 b=VygoF4D2dAt5krxXvpMzbqpERVk0gAoPN6SuGpg7eKQfZqhCqbczkVraT6FTkcQE8a
 aem1zXnJV6zJYRFyqkJLkuLM4AsywnbexVe68jauAAf3YbCoUMkdNTzQXm9Ho+bh+1Ej
 kS2eB0DGzDyo+03amdMJiyNCPTBsMSoA38ekTWlCR9JHl6d4d4N4Fa8wOmPu9JXQboOn
 koeLY96v2PPP98kwIvB3NcTxRC6d7jSqjdjDPT9hdMd8CD6isCZCfnJSREA0pQwmB8h+
 07FwUfufUJxqfXtEuNahj845jJZNA3BNdM1AP59Y6E3FwOiJ2FqTpsHCiV4uCkFXvWxv
 apiw==
X-Gm-Message-State: APjAAAV82MB4Nv55dRhqSp5/FKCSJkdk/PR1W20ItIyvUUtaSOdydFHt
 avPZKGK7qXWvzbhhiePcEvw=
X-Google-Smtp-Source: APXvYqzpni+ucvhEzBbxxIJYKppf0r5REEqwhVm66NXtYWNRygBcWFNpTWkvy9T6iLcmDoXZq8DoWA==
X-Received: by 2002:a63:ee04:: with SMTP id e4mr66521651pgi.53.1564147520023; 
 Fri, 26 Jul 2019 06:25:20 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id k36sm54544603pgl.42.2019.07.26.06.25.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 26 Jul 2019 06:25:18 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 sudheer.veliseti@aspeedtech.com
Subject: [patch v4 0/5] *** AST2500 DMA UART driver ***
Date: Fri, 26 Jul 2019 18:57:15 +0530
Message-Id: <1564147640-30753-1-git-send-email-open.sudheer@gmail.com>
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

In this patchset v4,all the comments provided for patchset v3
are addressed.Also there is considerable
change in the code related to how the per port
uart structure is registerd with uart core.
so the patch [patch v4 1/5] considerably differs from [patch v3 1/5]

Thanks and Regards
Sudheer.V

changes in v4:
- since TX uart interrupt is being invoked by 8250 framework
  instead of expected TX DMA interrupt,registration of uart port is changed.
  per port uart structure registration is done directly now
  instead of going throgh 8250 framework.
  so there is considerable change in code against v3 patch
changes in v3:
- custom debugs replaced with pr_debug in 8250_ast2500_uart_dma.c
- change logs added in patches

sudheer veliseti (5):
  AST2500 DMA UART driver
  build configuration for AST2500 DMA UART driver
  DT nodes for AST2500 DMA UART driver
  defconfig and MAINTAINERS updated for AST2500 DMA UART driver
  Documentation: DT bindings AST2500 DMA UART driver

 .../bindings/serial/ast2500-dma-uart.txt      |   43 +
 MAINTAINERS                                   |   12 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts      |   21 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |   71 +-
 arch/arm/configs/aspeed_g5_defconfig          |    1 +
 .../tty/serial/8250/8250_ast2500_uart_dma.c   | 1901 +++++++++++++++++
 drivers/tty/serial/8250/Kconfig               |   45 +-
 drivers/tty/serial/8250/Makefile              |    1 +
 8 files changed, 2090 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
 create mode 100644 drivers/tty/serial/8250/8250_ast2500_uart_dma.c

-- 
2.17.1

