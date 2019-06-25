Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 709CF54C93
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 12:43:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y2nN0LYyzDqNJ
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 20:43:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Po6yPSIb"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y2nD6hcZzDqKJ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 20:43:12 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f25so8761383pgv.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 03:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3jHKxS9Kogr9qqdX19ENZz0Qw2yWpRAgexX6QLS/rnc=;
 b=Po6yPSIbbWGLrfDa4V7fOtDKBArKnI5y9ekQZD2WUtoNTNkKBWC+AgyTwjt0CQ5GIM
 qlcxNytMoY0tYDp2vWF6XqgXeaTLunFRIVafN77Jb8cImPqBtg4gUTM01OL70kOg2z4m
 CTPXvk58hkItaFaZg+REyUGx7RFUsTSnQQhqYXwtwEYh5uAwIrQXQ0sEVnlxKPFpuY/i
 J37oorJzpwI0AwFSLc6wOzrSNlqFrcWP9S0JiNSlWtMc/Ron30hQZArGZuTdxYV4s7w/
 rANUxTU5/So+w/r5ASVy4WkdJjY+6p//mI1wlt40qsV0Z8eSKSAVfqYArn3aMI5hLX0M
 +0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3jHKxS9Kogr9qqdX19ENZz0Qw2yWpRAgexX6QLS/rnc=;
 b=eJ1xWYfltE0dTIpf+MoB7lQ6zsq/1TE5E8RB8KIXGUcV8GpAl1wIGyfiyLg4rEvLYn
 De9+9hIaUNs89Wduineo06Unmjj9O26VtrkuSu8ozXhA45AOpZVzZox7y7BDSMl0AfGE
 o5Kdf8jTebUkrVF0DC8/0ET7kpWI6Kphe2B/ijOSp1HJv9X++gefeAJ8gB7ZIPgu3XJ1
 5kaQjDq0nDXA8M0zHrrzF0dHaoIvqkeSqTjcSSRbJ4UOLQ0bZMmrOoX8RVjS2iDcVzIY
 9bs/zTtiRlE5fOsC7P1vz4sT1yYNtqYdnHxiq0r0D1qleGPlLShR/R0R0H/yzELxkzDa
 RDQA==
X-Gm-Message-State: APjAAAVG6P/FXz+++bz/j9PsDczwhf0NJimJctUOY2waRvltS1zp0kWc
 z14BE7YkGsRDK42qTGdgVxceVR2gHuc=
X-Google-Smtp-Source: APXvYqwNh9AJL+27sY07DzBTihEQMlT3d5EQd6GP5q9N2fehLoVqGOUbYiLPYolNd15XJSUo3vs9AA==
X-Received: by 2002:a63:a61:: with SMTP id z33mr20274329pgk.154.1561459390566; 
 Tue, 25 Jun 2019 03:43:10 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id 14sm22026759pfj.36.2019.06.25.03.43.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 25 Jun 2019 03:43:10 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 shivahshankar@gmail.com, sudheer.veliseti@aspeedtech.com
Subject: [patch v3 4/5] defconfig and MAINTAINERS updated for AST2500 DMA UART
 driver
Date: Tue, 25 Jun 2019 16:14:35 +0530
Message-Id: <1561459476-14268-5-git-send-email-open.sudheer@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561459476-14268-1-git-send-email-open.sudheer@gmail.com>
References: <1561459476-14268-1-git-send-email-open.sudheer@gmail.com>
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

defconfig changes to add DMA based UART in AST2500
Maintainers File updated.
Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
---

Changes in v3:
- Added changes logs 

 MAINTAINERS                          | 13 +++++++++++++
 arch/arm/configs/aspeed_g5_defconfig |  1 +
 2 files changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 997e27ab492f..c9a9790b97f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1347,6 +1347,19 @@ F:	drivers/crypto/axis
 F:	drivers/pinctrl/pinctrl-artpec*
 F:	Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
 
+ARM/ASPEED DMA UART DRIVER
+M:	sudheer v <sudheer.open@gmail.com>
+M:	ShivahShankar <shivahshankar.shankarnarayanrao@aspeedtech.com>
+R:	Joel Stanley <joel@jms.id.au>
+R:	Andrew Jeffery <andrew@aj.id.au>
+R:	Vinod Koul <vkoul@kernel.org>
+L:	dmaengine@vger.kernel.org
+L:	openbmc@lists.ozlabs.org
+L:	linux-aspeed@lists.ozlabs.org
+S:	Maintained
+F:	drivers/tty/serial/8250/8250_aspeed_uart_dma.c
+F:	Documentation/devicetree/bindings/serial/ast-sdma-uart.txt
+
 ARM/ASPEED I2C DRIVER
 M:	Brendan Higgins <brendanhiggins@google.com>
 R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 1849cbc161b4..25bf26630939 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -144,6 +144,7 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=6
 CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_AST_SERIAL_DMA_UART=y
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_ASPEED_VUART=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
-- 
2.17.1

