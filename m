Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D215ED1A
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Jul 2019 22:01:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fBnt5lB6zDqXQ
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jul 2019 06:01:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fBnm0zlWzDqW5
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Jul 2019 06:01:29 +1000 (AEST)
X-AuditID: ac10606f-bd5ff70000003de9-2a-5d1d0994a27d
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 BE.26.15849.4990D1D5; Wed,  3 Jul 2019 16:01:25 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 3 Jul 2019 16:01:24 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: <devicetree@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>
Subject: [linux,dev-5.1 v1] dt-bindings: gpio: aspeed: Add SGPIO support
Date: Wed, 3 Jul 2019 16:01:09 -0400
Message-ID: <1562184069-22332-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsWyRiBhgu5UTtlYg5ZJzBa7LnNYzD9yjtXi
 9/m/zBZT/ixnsmhefY7Z4vKuOWwWS69fZLJo3XuE3YHD42r7LnaPNfPWMHpc/HiM2WPTqk42
 jzvX9rB5nJ+xkNHj8ya5APYoLpuU1JzMstQifbsErozTB56wF/zjrej8cY+pgfEIdxcjB4eE
 gInE3N8ZXYycHEICu5gkdv4Q62LkArIPMUocbNzGDpJgE1CT2Lt5DhNIQkSgl1Fi0tPpzCAO
 s8AGRokrJxeAVQkLeEisXHmICcRmEVCRmPrxASOIzSvgIHF50RZWEFtCQE7i5rlOZoi4oMTJ
 mU9YQGxmAQmJgy9eMEOcIStx69BjJoh6BYnnfY9ZJjDyzULSMgtJywJGplWMQoklObmJmTnp
 5UZ6ibmZesn5uZsYIUGbv4Px40fzQ4xMHIxAL3EwK4nwfv8tEyvEm5JYWZValB9fVJqTWnyI
 UZqDRUmcd9WabzFCAumJJanZqakFqUUwWSYOTqkGRv+ItRMDnwTcfciRc9481NuKRyDX13tV
 UvKEurlTJAuW8JsumbOunXnr9Bfl8+cc0gw4bHV22jMelRtvH/CLtz46KOcpPdHEInNPfvr2
 AI+0klwFcdEk7nvn3klXZrQlWit93/6yJ2ptW+Hlb1JHnTdFRdXuPrtVfKbxuTQpVf8sft/e
 uUcXKLEUZyQaajEXFScCAGoFEF9IAgAA
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Hongwei Zhang <hongweiz@ami.com>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add bindings to support SGPIO on AST2400 or AST2500.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
new file mode 100644
index 0000000..f5fc6ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
@@ -0,0 +1,36 @@
+Aspeed SGPIO controller Device Tree Bindings
+-------------------------------------------
+
+Required properties:
+- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
+
+- #gpio-cells 		: Should be two
+			  - First cell is the GPIO line number
+			  - Second cell is used to specify optional
+			    parameters (unused)
+
+- reg			: Address and length of the register set for the device
+- gpio-controller	: Marks the device node as a GPIO controller.
+- interrupts		: Interrupt specifier (see interrupt bindings for
+			  details)
+- interrupt-controller	: Mark the GPIO controller as an interrupt-controller
+
+Optional properties:
+
+- clocks                : A phandle to the clock to use for debounce timings
+
+The sgpio and interrupt properties are further described in their respective
+bindings documentation:
+
+- Documentation/devicetree/bindings/sgpio/gpio.txt
+- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+
+  Example:
+	sgpio@1e780200 {
+		#gpio-cells = <2>;
+		compatible = "aspeed,ast2500-sgpio";
+		gpio-controller;
+		interrupts = <40>;
+		reg = <0x1e780200 0x0100>;
+		interrupt-controller;
+	};
-- 
2.7.4

