Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D21271928
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 04:07:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvnrV63KlzDqgb
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 12:07:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ziwh1Ovw; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvnrB2RxYzDqjX
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 12:07:06 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id d9so7954722pfd.3
 for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Sep 2020 19:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sn5K/Ys4ffnC/CyJiVbEeEFS78Vl8Zham2P4UxWGNJU=;
 b=Ziwh1OvwNb98aRPS1IfvK+ggJXAkMHMBg4+uc9Ms/7iaRLjUQF8zPClYzjeuDO7oUV
 8dIjjC/YkKSm587O6rz2kffYu9MhMZzZGzAAfVbeA59WGr7mEeKSNspdC9EyYgSJ45r5
 Iv86LPwzePwhw8sRsZ/HWQ0qktukwfJnzI1f1t2NLnSCeUe2b1L5g1tfei4T7XV42PFF
 EBFZ5cO3w8bCcqinCxJHAzPe9crOg8n3GuhUtT6TwOLw/u59bHwCWGK6mRTVaSRq7Mfx
 QjnYX/jnvMVaajEsSWtgXZMz/MFUrfVuV6X/hX/0uQnIx+lxOa0LWOldMZNsObDc90Ex
 nkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sn5K/Ys4ffnC/CyJiVbEeEFS78Vl8Zham2P4UxWGNJU=;
 b=s1c8UJuQ0uepczXyyZyD+FhNQTc69iSGuUncTiq9blUzGZi1bndJ4Ff/F+Gk1rHZex
 vxsE58onYVA3Og2Z3cra8I9lITy/PPQtEl194eIjP9r9pYNoBiBPYYUnHXyDFjH7aYrz
 o9SBbuRHZdAubRjHCG5xW2hdL5wPAz9+QC8h8kTFrNG3vujKN1j/pymso6/DI36hqr1t
 AdFS2ft3Bh5hUak2d7t+4YXk8A+1BuFG6+l2AKYd2w7EKIxRtaqLnnQZvUoszJOaKB1Z
 FsD6K5+n19uGdmaEV6K7Ivej9qRFj2vOk5jD5YgsQH+C53h8ouu749VrEYW1ejWv6Gm8
 GUZA==
X-Gm-Message-State: AOAM530x3J4lN64T8jcx7HdWlUgtuWjJje5Jwyqn4ZBz753kWeYJjyH/
 0Ck6ozMkeJdFEvCSJijrMJU=
X-Google-Smtp-Source: ABdhPJyQx6RC7ogqW+OrOcLs82eHfexrnrEdblukIn9TqL2NrqaIRomxbf3FJgFhwwo+u6IkMry5dQ==
X-Received: by 2002:a65:5249:: with SMTP id q9mr8892871pgp.79.1600654023755;
 Sun, 20 Sep 2020 19:07:03 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id z23sm10212045pfj.177.2020.09.20.19.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 19:07:02 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/3] ARM: dts: aspeed: Add silicon id node
Date: Mon, 21 Sep 2020 11:36:41 +0930
Message-Id: <20200921020641.48733-4-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921020641.48733-1-joel@jms.id.au>
References: <20200921020641.48733-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This register describes the silicon id and chip unique id. It varies
between CPU revisions, but is always part of the SCU.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix whitespace
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 5 +++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
 arch/arm/boot/dts/aspeed-g6.dtsi | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 82f0213e3a3c..b3dafbc8caca 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -192,6 +192,11 @@ p2a: p2a-control@2c {
 					status = "disabled";
 				};
 
+				silicon-id@7c {
+					compatible = "aspeed,ast2400-silicon-id", "aspeed,silicon-id";
+					reg = <0x7c 0x4>;
+				};
+
 				pinctrl: pinctrl@80 {
 					reg = <0x80 0x18>, <0xa0 0x10>;
 					compatible = "aspeed,ast2400-pinctrl";
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 9c91afb2b404..c6862182313a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -239,6 +239,11 @@ p2a: p2a-control@2c {
 					status = "disabled";
 				};
 
+				silicon-id@7c {
+					compatible = "aspeed,ast2500-silicon-id", "aspeed,silicon-id";
+					reg = <0x7c 0x4 0x150 0x8>;
+				};
+
 				pinctrl: pinctrl@80 {
 					compatible = "aspeed,ast2500-pinctrl";
 					reg = <0x80 0x18>, <0xa0 0x10>;
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index b58220a49cbd..1ce3a1f06f7f 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -311,6 +311,11 @@ pinctrl: pinctrl {
 					compatible = "aspeed,ast2600-pinctrl";
 				};
 
+				silicon-id@14 {
+					compatible = "aspeed,ast2600-silicon-id", "aspeed,silicon-id";
+					reg = <0x14 0x4 0x5b0 0x8>;
+				};
+
 				smp-memram@180 {
 					compatible = "aspeed,ast2600-smpmem";
 					reg = <0x180 0x40>;
-- 
2.28.0

