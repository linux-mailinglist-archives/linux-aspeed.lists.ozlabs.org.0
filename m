Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E58035C82
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 14:21:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JnwH2FNvzDqdq
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 22:21:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tlSG9UuB"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jnw56XMPzDqcS
 for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jun 2019 22:21:38 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id g21so9640271plq.0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 05 Jun 2019 05:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+mvlP3fCWubOTs9ufovlGWO4LIbpoCYwwxHP1hQzgBU=;
 b=tlSG9UuB2TIIVAhHkXyJteVss4sNjvVtjXzlISfVJ57kQpbON4O5dZEU9L18mwQYFs
 JTIdlAgGZ9RCft5JELCWRXMw5SqujYG2bU/gLo+3ZnGY0WHnf6nBLmJkY8zUoFWOEwEf
 i7cAHxNH1Mb9N+MyyYapQ9SPrP1qGmQOG2EFf+6r3EE8IxcDimOtAaTxl9VaUhgrvJ7B
 Y06vQcg8C2/sXWt8dY3VsyIlcZUCRLTER9dLcIkQ4C5t27gL5lDg3xSipRvENPcujW0F
 R3Gh8mmIpRo9kS+B0YfFcTYt+ZDhCI0V+0zUMWJPfGmfgjOePv/blY9BP6hnVJ18kbNI
 WhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+mvlP3fCWubOTs9ufovlGWO4LIbpoCYwwxHP1hQzgBU=;
 b=WAT3OUEjEEOQZzjZvHnk/OlzGi8O+RuzgYZHA3Sa6YnimN8sKWh5XVnVqFwvoJUIZb
 CyFIMrN2OASR6ry+e6rU88lLWUrIi38XUtFAzfbKBwUbWSmMMIno0DCOW+F5MldZ3JBe
 1qcPUcy1w2kJRvikjla7ROFYQs/jfm1DVD3HCI7A3o6aF4Dud++kzephNyzm8TrC1S4+
 If0W61+KICiS8Xvv5aeoZQEp71q6+kn+cDZLVaMdmx8ZlY/P98rd55g+9SNjRZWpKs+o
 LRqw3WKQKEmgNdNrxqne5q/C5g/3Uk+z4Zst1xboljdSfo5nKIb337dq/4Us13g6J2kY
 xhaw==
X-Gm-Message-State: APjAAAWpdtCb7sCh372lVmy0d9Tmno+wKPtuGshkfS8NRs7eCS0kJB2Q
 QyA4jB6Y/AvVH8LzEluflQY=
X-Google-Smtp-Source: APXvYqwbCXonwkvVPjKpk6HE8xu6iR7IhL2CJLmh9dIfEhZBwqq+WLhlUvdi0BcMGzufDaw9EJZ+1A==
X-Received: by 2002:a17:902:b194:: with SMTP id
 s20mr30104605plr.77.1559737294765; 
 Wed, 05 Jun 2019 05:21:34 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id q22sm3322094pff.63.2019.06.05.05.21.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 05:21:34 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, jslaby@suse.com,
 joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
 robh+dt@kernel.org, mark.rutland@arm.com,
 shivahshankar.shankarnarayanrao@aspeedtech.com,
 sudheer.veliseti@aspeedtech.com
Subject: [patch 0/5] *** Cover Letter: patch submission for AST2500 UART
 driver ***
Date: Wed,  5 Jun 2019 17:53:10 +0530
Message-Id: <1559737395-28542-1-git-send-email-open.sudheer@gmail.com>
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
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sudheer Kumar veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: sudheer Kumar veliseti <sudheer.open@gmail.com>

Hi,

The below mentioned patches are for AST2500 UART driver.

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
 .../tty/serial/8250/8250_ast2500_uart_dma.c   | 1928 +++++++++++++++++
 drivers/tty/serial/8250/Kconfig               |   35 +-
 drivers/tty/serial/8250/Makefile              |    1 +
 8 files changed, 2105 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
 create mode 100644 drivers/tty/serial/8250/8250_ast2500_uart_dma.c

-- 
2.17.1

