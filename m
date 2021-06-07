Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3816A39D34F
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 05:13:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyz3P34Vhz305r
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 13:13:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IkUpkw/4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IkUpkw/4; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyz3G4whkz2yXX
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Jun 2021 13:13:30 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 27so12758058pgy.3
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Jun 2021 20:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctdDGDWzUFSI032y96oflocptITS0jwu9qlP3dNJZfU=;
 b=IkUpkw/4K698JCUeyV2PlF1q56sIjEU7VzYVzRNK4GA1KEdzSEaK3QY+ziCAxmUinU
 txs5iZxZYJXOB5v/wFG1SviIhuK56K7Q9jIVLuEcpyhLGGCRfcJGDNPz/HscfbCnyGs6
 Zsw46nf92yv+PmofYRyemHjn1JNydhkmi21vX+0NTTSqIZ1UoR3leeMzwCHvSe2Sj1DK
 i9kIZ23CnLcB9TBm6ZFHl17kS9JHSEOfR/5Qx9aZKAPP5jnlHLYuniiV2Sj88t56o2m5
 2bYlE1RpPPFDTxo43UhXfrvywGNdZgPOWmmsNZTfy9t/sv2tsoFT0htv+SAH9numYaSK
 92/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ctdDGDWzUFSI032y96oflocptITS0jwu9qlP3dNJZfU=;
 b=mT9jdBKLI6nA8aXKH2K+xr8YBr41ChsU6qE098O6pnwD0SlgMdxZzSti1RkHL8cPFw
 tfnukPoYR+dYUoFcCY1JE6ec+XWCHSb2mEHC7oest9o1JpoL81RH+S3mLE1dj62wmlR/
 4b8i38fbg2OiaqV418/wuPYn36hzRRFzya8d80/P14JOWWYwOBYyFHNe1KfgKyMkmLGO
 K36WxqjAY0YDcgRSE/yqkXLv2b4Eh9nK5eFZ5qdSToW5gcKHX0H9IiClhuOqgOuL6AQC
 pMjXPbvvpe6R2rJI5/E4CnkNnA1OKj5fW2BTmotPFZp27Lo/KJa3Vi18dL2bvl9yQraX
 LSOw==
X-Gm-Message-State: AOAM531eXKYBWuI6VjXdzx5spwPHlG9DiLQhBBfHvn5E041IAHcyg0Ep
 nld2GzJH7sBrUyyaWQ77Yiw=
X-Google-Smtp-Source: ABdhPJzMx+ahqjdBDlwRql1smD7YZqwBJZ+kFPZIZZASf0UrwlxyF1lHB9Bo8bkMUIlblior1uTvDw==
X-Received: by 2002:a63:1021:: with SMTP id f33mr1099661pgl.236.1623035607844; 
 Sun, 06 Jun 2021 20:13:27 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x33sm5763751pfh.108.2021.06.06.20.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 20:13:26 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH 2/6] ARM: dts: aspeed: everest: Add nvme and fan indicator leds
Date: Mon,  7 Jun 2021 12:42:55 +0930
Message-Id: <20210607031259.475020-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607031259.475020-1-joel@jms.id.au>
References: <20210607031259.475020-1-joel@jms.id.au>
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
Cc: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

These are the indicator leds for nvme slots and fans and are
driven by PCA9552.

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 132 +++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 6a17b75b5d5b..03c26812c909 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -970,6 +970,138 @@ fan@3 {
 				};
 			};
 
+			pca_fan_nvme: pca9552@60 {
+				compatible = "nxp,pca9552";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				led@0 {
+					label = "nvme0";
+					reg = <0>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@1 {
+					label = "nvme1";
+					reg = <1>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@2 {
+					label = "nvme2";
+					reg = <2>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@3 {
+					label = "nvme3";
+					reg = <3>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@4 {
+					label = "nvme4";
+					reg = <4>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@5 {
+					label = "nvme5";
+					reg = <5>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@6 {
+					label = "nvme6";
+					reg = <6>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@7 {
+					label = "nvme7";
+					reg = <7>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@8 {
+					label = "nvme8";
+					reg = <8>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@9 {
+					label = "nvme9";
+					reg = <9>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@10 {
+					label = "fan0";
+					reg = <10>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@11 {
+					label = "fan1";
+					reg = <11>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@12 {
+					label = "fan2";
+					reg = <12>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				led@13 {
+					label = "fan3";
+					reg = <13>;
+					retain-state-shutdown;
+					default-state = "keep";
+					type = <PCA955X_TYPE_LED>;
+				};
+
+				gpio@14 {
+					reg = <14>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@15 {
+					reg = <15>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
+
 			pca0: pca9552@61 {
 				compatible = "nxp,pca9552";
 				#address-cells = <1>;
-- 
2.30.2

