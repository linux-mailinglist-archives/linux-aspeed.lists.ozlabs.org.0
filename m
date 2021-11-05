Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA17A445E9C
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 04:29:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlmFy3FJpz2ybB
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 14:29:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RIX6Y8FM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::749;
 helo=mail-qk1-x749.google.com;
 envelope-from=3dkweyqmkdhsnrjfnnfkd.bnlkhmtw-zroddckhrsr.nykzar.nqf@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=RIX6Y8FM; dkim-atps=neutral
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlmFv0W6vz2xXS
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 14:29:21 +1100 (AEDT)
Received: by mail-qk1-x749.google.com with SMTP id
 bm9-20020a05620a198900b004629c6f44c4so6190805qkb.21
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 20:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=7CQtFRKLxqx+qqsUKVRUJaYz4sr4nG/VYl5q0lBwYzk=;
 b=RIX6Y8FM251JQ3iML3SYH6Qs2eJhQ75+DtnYzmjHfU2udUaG852cuVUKAGsbWh4UXD
 PSuQvdQTLXOtL3wTkorMbZ/2vd2susg3jHJZIAWjupqhPDuAXbdDb3CAWffPzAHDcUSs
 sn2GbOL4iXc5fNSQiAhftUYrTNNqBe8zJpUc0/ViLatwZIY56aVFjcy8HvVEt6d9ZLV2
 Pguxyb3Cn3qpfwi5FDs7ZjET/j0qtn2O87N4Qt1ljMqTMbet4N1uOKdwu2Bvd6ivzHAN
 EKvnvtnk9wzYgYYUPXrc/zaT0eb4U9eRvf6y6MVP9d6+Bm5B6zXhCLLm95RRxNS8z1hg
 +3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=7CQtFRKLxqx+qqsUKVRUJaYz4sr4nG/VYl5q0lBwYzk=;
 b=mQbUx+c/Uw74dmaSz0C9Ap+qGFCm2wLPNOPdj7mIlTmmlJaYhKdgTXkL/MV/wp1m9r
 zRV1AkSIeAOJ+DdJfX+z5yj5dMSKfh1YXtBiKZeZyfdgSWhjbuIzTZ03lTFsryEqbuYw
 KLT0NikanJ/ZPBMR2E+MrJvst2fpbC26W3ucePuvoX5Xwb1FrDxgNrOYPGV1P/nVkJ1e
 V0XVJMmaEX72KkmyPy1nu7rurDD11PSampu05EfvjK8+DkFF5Y0Vqe1R3zz5nCfNTrqc
 9m9puP58C7dc0jPdXjVhT1K3MxbLVH3E6RnhgvGuoDxVg8cHHqvCsn/NbVRRcwU+ee2r
 1SHw==
X-Gm-Message-State: AOAM532VIEui+HTuxa0VplTcoZCst25RZqc2+oT8OnhmtA1GMly6mN3U
 2P0zQtb6MoQM681Tkl3UNAduFMc=
X-Google-Smtp-Source: ABdhPJyvMunnH5NqggnkiHuCluQZLQysSAvHHDAAqWNSvkewifEK1juuQ/FVxnm0Kw0Pcv6Dit8AhCs=
X-Received: from osk.cam.corp.google.com ([2620:15c:93:a:54be:9375:f9b:ec02])
 (user=osk job=sendgmr) by 2002:ac8:5ac9:: with SMTP id
 d9mr47311556qtd.383.1636082956536; 
 Thu, 04 Nov 2021 20:29:16 -0700 (PDT)
Date: Thu,  4 Nov 2021 23:29:10 -0400
Message-Id: <20211105032910.446492-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v3] ARM: dts: aspeed: tyan-s7106: Update nct7802 config
From: Oskar Senft <osk@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This change updates the configuration for the nct7802 hardware
monitor to correctly configure its temperature sensors.

Signed-off-by: Oskar Senft <osk@google.com>
---
Changes from PATCH v2:
- Add missing address-cells, size-cells configuration.
- Add missing new line between channel 0 and 1.

Changes from PATCH v1:
- Removed superfluous "status" from channels.
---
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
index 68f332ee1886..60ac6d3f03b5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
@@ -213,6 +213,30 @@ &i2c0 {
 	nct7802@28 {
 		compatible = "nuvoton,nct7802";
 		reg = <0x28>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@0 { /* LTD */
+			reg = <0>;
+		};
+
+		channel@1 { /* RTD1 */
+			reg = <1>;
+			sensor-type = "temperature";
+			temperature-mode = "thermistor";
+		};
+
+		channel@2 { /* RTD2 */
+			reg = <2>;
+			sensor-type = "temperature";
+			temperature-mode = "thermistor";
+		};
+
+		channel@3 { /* RTD3 */
+			reg = <3>;
+			sensor-type = "temperature";
+		};
 	};
 
 	/* Also connected to:
-- 
2.34.0.rc0.344.g81b53c2807-goog

