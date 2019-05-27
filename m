Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 627462FE7D
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 16:52:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45F9Y83bkPzDqSP
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2019 00:52:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="IFxJuXuZ"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CF8h61mXzDq61
 for <linux-aspeed@lists.ozlabs.org>; Mon, 27 May 2019 21:28:20 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 82E4841911;
 Mon, 27 May 2019 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1558956495; x=
 1560770896; bh=hXOGDL4taCvP1ithY6ztG6O+TLXxq3fYLx4Y5rx99Wc=; b=I
 FxJuXuZ3B761O2ZaPsK9sTEUtpSCGEkqp35iClcQ67KEZaJjPncOeUJLHnSnwTI4
 gcK60qmn8gFJd8h0QB5PYt+qat+QlSHvj7UjX+P+n95cwb78YRkmtaaCK0CzJT/V
 TSOhH4hY++ZiQXWBFu360g08/WCWv+5U5PmlGMy2Xc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzR7FsWWSxkt; Mon, 27 May 2019 14:28:15 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8B78A404CB;
 Mon, 27 May 2019 14:28:13 +0300 (MSK)
Received: from bbwork.com (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 27
 May 2019 14:28:13 +0300
From: Alexander Filippov <a.filippov@yadro.com>
To: <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH] ARM: dts: aspeed: g4: add video engine support
Date: Mon, 27 May 2019 14:27:53 +0300
Message-ID: <20190527112753.1681-1-a.filippov@yadro.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.14.115]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-Mailman-Approved-At: Fri, 31 May 2019 00:50:57 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Filippov <a.filippov@yadro.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add a node to describe the video engine and VGA scratch registers on
AST2400.

These changes were copied from aspeed-g5.dtsi

Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 62 ++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 6011692df15a..adc1804918df 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -168,6 +168,10 @@
 					compatible = "aspeed,g4-pinctrl";
 				};
 
+				vga_scratch: scratch {
+					compatible = "aspeed,bmc-misc";
+				};
+
 				p2a: p2a-control {
 					compatible = "aspeed,ast2400-p2a-ctrl";
 					status = "disabled";
@@ -195,6 +199,16 @@
 				reg = <0x1e720000 0x8000>;	// 32K
 			};
 
+			video: video@1e700000 {
+				compatible = "aspeed,ast2400-video-engine";
+				reg = <0x1e700000 0x1000>;
+				clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
+					 <&syscon ASPEED_CLK_GATE_ECLK>;
+				clock-names = "vclk", "eclk";
+				interrupts = <7>;
+				status = "disabled";
+			};
+
 			gpio: gpio@1e780000 {
 				#gpio-cells = <2>;
 				gpio-controller;
@@ -1408,6 +1422,54 @@
 	};
 };
 
+&vga_scratch {
+	dac_mux {
+		offset = <0x2c>;
+		bit-mask = <0x3>;
+		bit-shift = <16>;
+	};
+	vga0 {
+		offset = <0x50>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga1 {
+		offset = <0x54>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga2 {
+		offset = <0x58>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga3 {
+		offset = <0x5c>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga4 {
+		offset = <0x60>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga5 {
+		offset = <0x64>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga6 {
+		offset = <0x68>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga7 {
+		offset = <0x6c>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+};
+
 &sio_regs {
 	sio_2b {
 		offset = <0xf0>;
-- 
2.20.1

