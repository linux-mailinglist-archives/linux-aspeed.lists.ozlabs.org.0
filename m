Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF724E6FB
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 13:16:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Vbjt30cMzDqWk
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 21:16:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qsv5gJl+"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VbjW399szDqdZ
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 21:16:31 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id r1so3426210pfq.12
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KMyXv5aakUqqkMZrvi++eRfv70/KfjHLYwh+rLZXzWg=;
 b=qsv5gJl+MMjFjLl6q60KT5vpch2f6ZLYb+7BzlP50HQ/8+LY1SZoelxfS45G4prSXP
 M0BH3/HsELaYFRN0Utwi/uINzNXSRExFaBnR3RBr6b8MK+1DaYjMLMOsSsrHZMug8rIS
 Zj5F1mf1roU56bjCSihvM5gOtX/x4SAYU85qjBD5eUmL+O0Nx6qJhAdTlbCNWqG2SXRI
 50Ij1AOsMsM5sgYY9aY8aLPr0pG0zcYHY7X1CAzL30TOv9RDGOM8DpYeCmKnAC75hVj8
 1lvMMZPSv/ViO0Z/6aDEgik+fu2FPqXsDTnzXVlBMY0UneMwanA6l78dTVotju8tFhbn
 giHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KMyXv5aakUqqkMZrvi++eRfv70/KfjHLYwh+rLZXzWg=;
 b=bF4sj+LpdLxinSJBnptGCFykLkSsTx80Jo2LR7H1tDqSTr0A4HuVduEKOIYL7SDrFM
 Y+i4DrOCvVpvgFDrnfh263VYFFRc7WvcsPJdC+2+5AOwsHxNBdAeqs81yx98Cy+/eLyU
 Vztm7/OI++fJS89Ny15AKGrj7sXX7v+Y5DVB2mPA5W53HyjIbt5ypjUbVRbIwmeNK3sk
 Dyqrz0ixaKF3y62lG/UL+lOhnCM7UICuWr4JwQLVnYHVpBr1EIZNXWiZfxCsuab7ylBK
 r+NYGVH4dkRXwj7me3cNJb3EofPvR7sSMFE4O+ZOGdB1j82/ntLfUbj5juD/jDx27qmS
 Brug==
X-Gm-Message-State: APjAAAWUEIEhNvInzFLFVC6s1oBvCCxDHxSWfifMBbqYJaVYmpvrkagB
 1T2B4lCsMtl7WIv6Depz9p4=
X-Google-Smtp-Source: APXvYqzYNtXxb4tzWuDYvtdWaeALgnRgqk7i5JnGPvjR757T4G/qDe0ZN4RVho1fH/Ibw4XCUdjIDg==
X-Received: by 2002:a17:90a:9291:: with SMTP id
 n17mr5871711pjo.66.1561115788928; 
 Fri, 21 Jun 2019 04:16:28 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id w4sm2405737pfw.97.2019.06.21.04.16.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Jun 2019 04:16:28 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 shivahshankar@gmail.com, sudheer.veliseti@aspeedtech.com
Subject: [patch 5/5] Documentation: DT bindings AST2500 DMA UART driver
Date: Fri, 21 Jun 2019 16:47:35 +0530
Message-Id: <1561115855-4186-6-git-send-email-open.sudheer@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
References: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
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

Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
---
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

