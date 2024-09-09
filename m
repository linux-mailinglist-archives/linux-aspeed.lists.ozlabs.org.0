Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA99971126
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 10:07:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2KDy74JKz30W5
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 18:07:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725869230;
	cv=none; b=f+yDqEmdQrOIjH22dKt7CmbGDAxGlEFYU/nQB06yq1C3Slr/RdvHYRprmdKgsB9N73AImniEaqyghBksN8vXeYKkHOhn4ttT8xzDST1p2iHV/Hj+HxAN287dMahr1vA045KYv9W6+amKJ7eQu7yhsgYxSs+3V71UKotXe5cseU73lXIQE2MQ1aQHctgz9XklsW4mQmcRzA9nuurNXv1Pccg10YgSHk7uVpzXZVqfka3TYrrgp0gk01btTNP04dVU0T9ymBKqDX2mvYMI0A3r2idYVng//hiWe3+t0R0+H52v8vFcB+lLFxJDtauytHUWy8QRgX0L9LoZE2+NXUaVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725869230; c=relaxed/relaxed;
	bh=YrsojVcXdP7VbUJkVIZWlDcZmLbxH8yTx3aUvs3NVIY=;
	h=DKIM-Signature:From:To:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=Nuz2nBr4lOzQAFoO9cmEIIUClojrAlG+7rdNz7g/z48XHx2Rg5m/eVKrMbQiUfvnmDAVeGzQa+dHztDt6N7qTjSjPFdqXDlGmIZr626gjII6Ys4ufwk1SQ5xk8IzcUYpjkfcifzHGvJnrTJtE1Pn7h39mwwiZXSiBWkz871zGO74pkD9A6DZN9y8/eBaKpC3etDtc5jzKxElbg9Z8Lfs5UaN7tc/OEGWJDrI49d8Tj36xIETfPrgD00sACwIkCtBvl6ikEJyeN/XbW33ovjgniEbYElq1s5jRu7EyfQwsjg5h0/Fz4HJsc48Ix2rdOf9PQO2HnFXOXOH8SD/GCUdCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xnl+wu0D; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xnl+wu0D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2KDt4KHJz2xZQ
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 18:07:10 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2d1daa2577bso2918242a91.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Sep 2024 01:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725869228; x=1726474028; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrsojVcXdP7VbUJkVIZWlDcZmLbxH8yTx3aUvs3NVIY=;
        b=Xnl+wu0DeyXqTVLOX436kT1kqM5eEYwfM4gdMby9cPU5KPZ+kiI6jSsmpv2yguQ54M
         FnHr5UYRWD9KdYuzoBE6bYXwhWH6PD7kzmcfe/VaVc83LYO7GnnQG4pR+tYNZ37GKk7f
         t000QwuTGAQuZ4qy4tN5OrZ67XH0q+S7bDB+oHTsjJPLYDYULjYFu8C6k1FjRIxSYWkE
         IpiPha9rX3Bjx6fsXR+OmI9eo5SgDC/aRHvQfRC/BGPVY3/7ii0WQaA2upEm3EheU0YH
         JzBu/miIkokeEMxTk3oFJcsiJbDm2l7XAhBYITCwfthQWG4FO0v0KzZA9sap0pE7wLPP
         4aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869228; x=1726474028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrsojVcXdP7VbUJkVIZWlDcZmLbxH8yTx3aUvs3NVIY=;
        b=m/4GJ+hHSJzG3N7jOYMMUE6OY4AIFTzDA/f41tdsw2Wkl6yFLh39aH0ZbWyUYueVxg
         7Qf2w+VY3Y1uByXU749pfNm0Y3Jb6Np/opg84l1pmMhJo+XdRxgvjT1O6f9VJMm6SAmt
         345qs+o9t37O5NomGifWz5rrVll+FB4gJ51MhO80FwsTFOB+oiPE7kmQu2TK5qTIw4F1
         yN7VlfdDluRZi3/+fR+TF6sm0q+vfb7NUFoWdECbBy27iFe0b+oKVGNSgQxDi8Yh7N/W
         nN0QuVdMWyxHZDw2p0tSI6futV4b2lIHfmXF5vuVvwTeHks8IuTj9l81fWH2bCNRt+Ia
         kACA==
X-Forwarded-Encrypted: i=1; AJvYcCVW9wHX2u8t1HmlMLlhNnin/IxEyfS+DcIljSxosl/RI4oJy2PMoJw8KDYRI8gSUOOcUi/H4+zz5X6pHJM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4997OFj2d8bpwDHiZXyfkYmvDy+EdxJG4+Hy7IWXEMqiRAR7o
	RAT0SkJ86SLx8fRhI97pVN72KBjeJKibEk7+0SXHcYRa5aOcd5r0
X-Google-Smtp-Source: AGHT+IFVeStqcCLHFeJFmPSKwkY6xVOD7KFhLsjEH2hXJSBguqu/gXh13TrqWZOjarwMr7+jXXH3aQ==
X-Received: by 2002:a17:90a:c706:b0:2da:8974:b3e3 with SMTP id 98e67ed59e1d1-2dafd0971e1mr7978914a91.27.1725869227864;
        Mon, 09 Sep 2024 01:07:07 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c4916sm3917541a91.31.2024.09.09.01.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:07:07 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] ARM: dts: aspeed: Harma: revise sgpio line name
Date: Mon,  9 Sep 2024 16:04:59 +0800
Message-Id: <20240909080459.3457853-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240909080459.3457853-1-peteryin.openbmc@gmail.com>
References: <20240909080459.3457853-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

power-card-enable
power-fault-n
power-hsc-good
power-chassis-good

asic0-card-type-detection0-n
asic0-card-type-detection1-n
asic0-card-type-detection2-n
presence-cmm

uart-switch-button
uart-switch-lsb
uart-switch-msb

reset-control-cmos-clear

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 36 +++++++++----------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 92068c65eae4..9cb511a846e3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -393,12 +393,6 @@ gpio@31 {
 		reg = <0x31>;
 		gpio-controller;
 		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"","","","",
-		"","","presence-cmm","",
-		"","","","",
-		"","","","";
 	};
 
 	// PTTV FRU
@@ -422,12 +416,6 @@ gpio@31 {
 		reg = <0x31>;
 		gpio-controller;
 		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"","","","",
-		"","","presence-cmm","",
-		"","","","",
-		"","","","";
 	};
 
 	// Aegis FRU
@@ -566,7 +554,7 @@ &gpio0 {
 	/*B0-B7*/	"","","","",
 			"bmc-spi-mux-select-0","led-identify","","",
 	/*C0-C7*/	"reset-cause-platrst","","","","",
-			"cpu0-err-alert","","",
+			"power-hsc-good","power-chassis-good","",
 	/*D0-D7*/	"","","sol-uart-select","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
@@ -585,14 +573,16 @@ &gpio0 {
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"power-button","power-host-control",
 			"reset-button","","led-power","","","",
-	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
+	/*Q0-Q7*/
+			"","","","",
+			"","power-chassis-control","","uart-switch-button",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","led-identify-gate","",
 	/*V0-V7*/	"","","","",
 			"rtc-battery-voltage-read-enable","",
-			"power-chassis-good","",
+			"","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
@@ -673,7 +663,7 @@ &sgpiom0 {
 	"presence-asic-modules-0","rt-cpu0-p1-force-enable",
 	"presence-asic-modules-1","bios-debug-msg-disable",
 	"","uart-control-buffer-select",
-	"","ac-control-n",
+	"presence-cmm","ac-control-n",
 	/*G0-G3 line 96-103*/
 	"FM_CPU_CORETYPE2","",
 	"FM_CPU_CORETYPE1","",
@@ -685,7 +675,7 @@ &sgpiom0 {
 	"FM_BOARD_REV_ID2","",
 	"FM_BOARD_REV_ID1","",
 	/*H0-H3 line 112-119*/
-	"FM_BOARD_REV_ID0","",
+	"FM_BOARD_REV_ID0","reset-control-cmos-clear",
 	"","","","","","",
 	/*H4-H7 line 120-127*/
 	"","",
@@ -700,7 +690,7 @@ &sgpiom0 {
 	/*I4-I7 line 136-143*/
 	"","","","","","","","",
 	/*J0-J3 line 144-151*/
-	"","","","","","","","",
+	"","","power-card-enable","","","","","",
 	/*J4-J7 line 152-159*/
 	"SLOT_ID_BCB_0","",
 	"SLOT_ID_BCB_1","",
@@ -716,9 +706,15 @@ &sgpiom0 {
 	"cpu0-thermtrip-alert","",
 	"reset-cause-pcie","",
 	/*L4-L7 line 184-191*/
-	"pvdd11-ocp-alert","","","","","","","",
+	"pvdd11-ocp-alert","",
+	"power-fault-n","",
+	"asic0-card-type-detection0-n","",
+	"asic0-card-type-detection1-n","",
 	/*M0-M3 line 192-199*/
-	"","","","","","","","",
+	"asic0-card-type-detection2-n","",
+	"uart-switch-lsb","",
+	"uart-switch-msb","",
+	"","",
 	/*M4-M7 line 200-207*/
 	"","","","","","","","",
 	/*N0-N3 line 208-215*/
-- 
2.25.1

