Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F6935CA2
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 14:23:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jnxf3hyyzDqXq
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 22:23:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nHh7huEu"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JnxV0jW9zDqdm
 for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jun 2019 22:22:53 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id d30so12297336pgm.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 05 Jun 2019 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZMegKM8wWW12mRi+MHt1/qZvnpSW4OXC3WMf+x5ezYU=;
 b=nHh7huEudBGHGSGsoXcJZWNCEG8sqqMdqOdx41G7EdAa1ie0yElYinI077yIzI9dWj
 4nZq+6q6gMF9c6AevrkPCj4qo4vjl33pfqBSZ4rUzIoprPImkUmSOipVtndz9+7m3fQc
 Anv2Q6CEl6x1Jkp2E6vVLzIODq7Y2kg+/buXTcNGE+nwKBtFbUOjSCfEnUOEvsjKo1pl
 jpNoY/LMoUqm2DrkVPLjkM3jFTDN29Uu2AjVqmfTpzsdtvomdcxEt6o/hhs6fdMZU3mn
 rJ/Cjoo8nL2xpmztsLzyg9gbh9tTjEphlOwP1k/4dtYJdz2izUI6b9ZFef4Oy6BAB1jF
 bfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZMegKM8wWW12mRi+MHt1/qZvnpSW4OXC3WMf+x5ezYU=;
 b=jgXxT5f0cywA/XCbtXb5QfjG1Yxe4Vlyw4zmBQsCJ2UWmrmE1sN9OockOivhmOC1OX
 4utTQoWLywiCTlaUl1I4XBFrY71PTYNUy9/C2hwkt1w9Ym/7V9shlpy5FRivae1SOL42
 WMK4aRLtHfvnN9nQpts6ISqnP8OR96vh6nbjfBlgwb/T7t92jid27zcHlkmr3BJqQEHE
 vcFCoP1pmnSvof4HNQmCbpPcR2dKZ5yX//x53Vr8HHbdHkV33rpPaAVpScfkRWBCdpxa
 evBbf1xj0o0sZygD1h9dbT3GuyTMyS0wDfc7zyGUHO6LDG2AB9Il9IYZzwj0/xRvjgzI
 OKnA==
X-Gm-Message-State: APjAAAVh/OKHSkuH/X3JjD0znC/erdMNRnHcC/gRh+1okXqpYKBTVE9v
 sqtJlrxlKPVfCPQuoy7/ZW8=
X-Google-Smtp-Source: APXvYqx3JLlETUC7Lz0qh6z/ky5aPPycE+3p8YvXay93Ps9ocB1UGX+LAEPMGJu4m+nDEZ9WaQLYUA==
X-Received: by 2002:a17:90a:2ec3:: with SMTP id
 h3mr43937862pjs.101.1559737371398; 
 Wed, 05 Jun 2019 05:22:51 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id q22sm3322094pff.63.2019.06.05.05.22.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 05:22:51 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, jslaby@suse.com,
 joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
 robh+dt@kernel.org, mark.rutland@arm.com,
 shivahshankar.shankarnarayanrao@aspeedtech.com,
 sudheer.veliseti@aspeedtech.com
Subject: [patch 5/5] Documentation: DT bindings AST2500 DMA UART driver
Date: Wed,  5 Jun 2019 17:53:15 +0530
Message-Id: <1559737395-28542-6-git-send-email-open.sudheer@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559737395-28542-1-git-send-email-open.sudheer@gmail.com>
References: <1559737395-28542-1-git-send-email-open.sudheer@gmail.com>
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

Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
---
 .../bindings/serial/ast2500-dma-uart.txt      | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt b/Documentation/devicetree/bindings/serial/ast2500-dma-uart.txt
new file mode 100644
index 000000000000..ff9bb6146bd6
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
+This DMA controller node is included in DT just for Register and interrupt details
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

