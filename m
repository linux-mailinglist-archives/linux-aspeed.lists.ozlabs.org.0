Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8DF54C95
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 12:43:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y2nW3MWnzDqNn
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 20:43:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kUuIF6rH"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y2nL0wgWzDqNw
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 20:43:18 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id b7so8656963pls.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rkU+SjzCEWdgQCPJHmPaU3HbLqD9ceb7FSy53eQ0IIE=;
 b=kUuIF6rHI5NKBa5iWf2twpG18ea8+rZHSY1Kax01fxVPvrvjYf9h+7itV2ANaHaT4S
 0wXmGNs1c1XvV5YWxiFZW5J2iynhf+YLlkfLnTN3QQoY5KN3oqXr6/A1Gv/VVY08ZVB2
 Y/OSPQMKwzsVXe7KuIbBd6CiXikmUoYcJ35JT1qV1fHn++ZnWK+Yr9ley14eD+aVuD79
 DLycYsfIqXwGL+rz1pPWUF+Hgk05kzp+3w8ys2UzNednQ1E0ptHsiIprP9o4zN2aUguG
 K8GzkUQB7pvVNBp1Hi+eJjU/Qnz3CE+DYOyz82XW/46iAn7D9hYHXJJHM2AGVMynzFpe
 Zd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rkU+SjzCEWdgQCPJHmPaU3HbLqD9ceb7FSy53eQ0IIE=;
 b=MXh4v5KL5+xldBE6K13sqFBnyZKHuCyY5lJmmsJ3L1micB+5qmKQuIuxMfJ813uSf7
 8EwGyHc9q2Cw/82nXYjzaSQE4WWkeiZx4NpAqPZj4EZgBh3g40sztebDn2IlliXSwWhW
 tg366bxYSflk101QZ+oTitzT5fcJ76S4Rth6xRXwxguDQuWXivH/Coc+3a5K3Fcp/qyl
 PFi2MVWLcUq/AVdjU67OLECUkLekamaQivO0mT/KirXaU/qJXmwAiuahCwsxIMbYsNNU
 tq2G6ZOXAB3dpY9t6riXWbYvZ7EfrrrMvKvwoDz4SvcTVBAxyl7g2Cx4B/5crlJHDHzn
 tszQ==
X-Gm-Message-State: APjAAAXCxJ8eEkNBAzMMZ74lvqDWiEHwI6JtLqAF5RqVvwC6bxpoj4PR
 m6alnvEIVMbJJwMHbIZ7BXU=
X-Google-Smtp-Source: APXvYqzZn/CgQDrn7rDPGw4KYvyAuYwZGm7rkrHHdSrHZZfcaTfeRmErNwWLBQ9WwkiMPzzf74Eh1g==
X-Received: by 2002:a17:902:4201:: with SMTP id
 g1mr45846094pld.300.1561459396428; 
 Tue, 25 Jun 2019 03:43:16 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id 14sm22026759pfj.36.2019.06.25.03.43.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 25 Jun 2019 03:43:15 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 shivahshankar@gmail.com, sudheer.veliseti@aspeedtech.com
Subject: [patch v3 5/5] Documentation: DT bindings AST2500 DMA UART driver
Date: Tue, 25 Jun 2019 16:14:36 +0530
Message-Id: <1561459476-14268-6-git-send-email-open.sudheer@gmail.com>
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

documentation for Dt bindings for DMA based UARTs in AST2500

Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
---

Changes in v3:
- change logs added

.../bindings/serial/ast2500-dma-uart.txt      | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt b/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
new file mode 100644
index 000000000000..6f01ddecba56
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
@@ -0,0 +1,40 @@
+
+node for DMA controller:
+                       ast_uart_sdma: uart_sdma@1e79e000 {
+                               compatible = "aspeed,ast-uart-sdma";
+                               reg = <0x1e79e000 0x400>;
+                               interrupts = <50>;
+                               status = "disabled";
+                       };
+this node  doesn't binds with any driver.
+DMA controller is handled as a separate SW layer,and is included in the same driver.
+This DMA controller node is included in DT just for Register base and interrupt details
+
+
+
+node for DMA-UART :
+
+
+Required properties:
+
+- compatible: "aspeed,ast-sdma-uart"
+- reg: The base address of the UART register bank
+- interrupts: should contain interrupt specifier.
+- clocks: Clock driving the hardware;
+- pinctrl-0 : list of pinconfigurations
+- dma-channel: channel of DMA-controller which is used
+
+Example:
+
+                 dma_uart1: dma_uart1@1e783000{
+                          compatible = "aspeed,ast-sdma-uart";
+                          reg = <0x1e783000 0x1000>;
+                          reg-shift = <2>;
+                          interrupts = <9>;
+                          clocks = <&syscon ASPEED_CLK_GATE_UART1CLK>;
+                          dma-channel = <0>;
+                          no-loopback-test;
+                          pinctrl-names = "default";
+                          pinctrl-0 = <&pinctrl_txd1_default &pinctrl_rxd1_default>;
+                          status = "disabled";
+                       };
-- 
2.17.1

