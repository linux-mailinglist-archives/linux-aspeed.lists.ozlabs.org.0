Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6465654C82
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 12:42:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y2mq46nPzDqMN
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 20:42:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f0R/j+8c"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y2mh6TmHzDqK9
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 20:42:44 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id i189so9261507pfg.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1uMFvdA9zD0TW36wu1ROblZoYCBPkNlkO2ia2DlAOOo=;
 b=f0R/j+8cwVS5csLWk6p5Ykg9xNZW0+umrEPAJ3HxBV4gG9Bw2yhyhB9sn49qE5Zrv+
 AGFN3ejYP8YtKwR7g8vgMWS3lRP/dY6SmujIakxV4B/gwq2fepV15w/4waWXzPY1qZfJ
 Vk51rxlvmoCKoFn6zALdPIwIj24YqqeCKjywnR6ottpAP7NU1ndYJ4+kHvZkZTf1iL9+
 /ElGY1TjxP0hHokScFuCqeW4Gvl+8Xxp2d/iwMKwIKu5VY0uaSoLu3ctv8IgDqoHP887
 unK7l0vZ0ltcYjo+Rg86TIpmX6Wgn5rAYY2vujaTRmhqba2E5tRU01mGmHyNL31LZxxt
 /DBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1uMFvdA9zD0TW36wu1ROblZoYCBPkNlkO2ia2DlAOOo=;
 b=eqhw1ndtoclwqBRVSJ33gPUNNea+fbNYfy9khYBr4kFwiyyzAgJYLTIs9xSuK8vFDh
 pRF+E05VOJjs1quqpII963q60sy0lMaWGjjKIuqi2UcFmrwAQr3KZdPu+QHvt7anKasZ
 uyIveWlQaSTEAM3sg3dLZInUfN/bmACqIYgG7bihhF8ou6a69GRFKaTLJ5FuNexhN+Ef
 pCVt9MrBmlGbTaw4lYgxBDNhPq5CVG6sZaR+bedCXBEpyYlYnZamNJESytwdnejIQqxJ
 SeFYiRTPb1CkAaBOcBxDAYUxEA33zgqMQdWj7cuCUmcLitcZHh4iQAvlsyAhxiOL+JQ+
 KDKg==
X-Gm-Message-State: APjAAAWwrZnxAKnIImEt532JeSs3dzsjVPRg7fVoC3Os1/sNr6k/DE/0
 KZNra25hzc1dQhQJO6Fvn5k=
X-Google-Smtp-Source: APXvYqz07ytF5AwY9QhulPVIkFTT7bio8bpxCxvXzud/mQQUQXGy0FbUpYnn5JsBdLZntdfuj+fjHg==
X-Received: by 2002:a63:f342:: with SMTP id t2mr35787408pgj.83.1561459362300; 
 Tue, 25 Jun 2019 03:42:42 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id 14sm22026759pfj.36.2019.06.25.03.42.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 25 Jun 2019 03:42:41 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 shivahshankar@gmail.com, sudheer.veliseti@aspeedtech.com
Subject: [patch v3 0/5] *** DMA based UART driver for AST2500 ***
Date: Tue, 25 Jun 2019 16:14:31 +0530
Message-Id: <1561459476-14268-1-git-send-email-open.sudheer@gmail.com>
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

changes in v3:
- custom debugs replaced with pr_debug in 8250_ast2500_uart_dma.c
- change logs added in patches

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


