Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 030555ADFAA
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 08:20:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMFcw6NX8z3bZP
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 16:20:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fl4hRRFl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fl4hRRFl;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMFcs5KBQz3bb2
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Sep 2022 16:20:45 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d12so10329322plr.6
        for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Sep 2022 23:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3Kvr9t8tl1/ms0/7xPHpz9WdqpLe/wgSflXORB7TJd0=;
        b=Fl4hRRFl5sMh4BN5/k16jkd3sP6MTf3gaTHSBGMWQ6tlGQgGIVMGz1MsvoHYey997j
         ylt+tl6FiSGMSMJqweBQVHc+Yz/Q9wqhd8sEsdxcpFLFb9LpaaFDGMA8vFP56lbPLa2F
         Laho1GWqhs5jrLoFarET3QX1qzHALDUK6Q381LQalztW/EmeIvMHXyq/25oCKXPKQ2XI
         r9D0nzjt+BoRMTXh+TmeV84uOaPsh9wbvdyElKy28cVu+og91IwhZSdSPQSl+qVOAMLg
         gGgWcup79BJw06q4InpwI5cxsjSTlIBS4rysbxcjQaoXJcGb1hzce65Z9/ABgK58f3z0
         qojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3Kvr9t8tl1/ms0/7xPHpz9WdqpLe/wgSflXORB7TJd0=;
        b=B81GXVYUajkIwwaGLByVrqcdldAgCRlQs4Nr4yDrqWkeHh77QIU9hFyL7LJLwiaA6q
         wjdKgbcmR1gJs29/t1VL4njDXqu2xd7nBE4p1qbEddQeWL8gbHxjli5i8f7//iIePfc9
         mzZmQcPDh5MhZk1HrifCCBFbxKU2yOGAHfIGEwHZlpByD2+lHdca5kXrVl7W0A2iiaN0
         EZn+kO3Ae+SKTctskUkTRxJ79ENQ4m956dK1A/tCsvq5dCZql0F9LhdQMX0BCIi7LGZj
         dxCTXD7X0o7mfRhp2GFlQ3FtXr+8I9PFza9gfQc96ztGz8VCQ6rtQvc+4rEitoOzhoU7
         NOYg==
X-Gm-Message-State: ACgBeo1yEcTSRD8vmk9mWdSWAevNExc/Rl8M1rdsGNspgp82cBhcYP/X
	nkHvypH2mUFdxdViQ6tIspI=
X-Google-Smtp-Source: AA6agR6mgN6a8EMCkb2sUzh84tuyTkJRzb3cEOqOWShLqubfN42tc50cBynnYgKnWZ78FPXvtqlsow==
X-Received: by 2002:a17:902:ab98:b0:172:a566:d462 with SMTP id f24-20020a170902ab9800b00172a566d462mr51817770plr.53.1662445243373;
        Mon, 05 Sep 2022 23:20:43 -0700 (PDT)
Received: from localhost.localdomain ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id m16-20020a170902db1000b00172dd10f64fsm8877798plx.263.2022.09.05.23.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:20:42 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heyi Guo <guoheyi@linux.alibaba.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Guangbin Huang <huangguangbin2@huawei.com>,
	Liang He <windhl@126.com>,
	Hao Chen <chenhao288@hisilicon.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Tao Ren <taoren@fb.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] ARM: dts: aspeed: elbert: Enable mac3 controller
Date: Mon,  5 Sep 2022 23:20:26 -0700
Message-Id: <20220906062026.57169-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220906062026.57169-1-rentao.bupt@gmail.com>
References: <20220906062026.57169-1-rentao.bupt@gmail.com>
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

From: Tao Ren <rentao.bupt@gmail.com>

Enable mac3 controller in Elbert dts: Elbert MAC3 is connected to the
BCM53134P onboard switch's IMP_RGMII port directly (fixed link, no PHY
between BMC MAC and BCM53134P).

Note: BMC's mdio0 controller is connected to BCM53134P's MDIO interface
for debugging purposes only: BCM53134P always loads configurations from
its EEPROM, and users should not configure the switch via the MDIO
interface. As a result, the MDIO connection is disabled in dts.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
  - updated comments and patch description.

 .../boot/dts/aspeed-bmc-facebook-elbert.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
index 27b43fe099f1..36657d8fdb73 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
@@ -183,3 +183,23 @@ imux31: i2c@7 {
 &i2c11 {
 	status = "okay";
 };
+
+/*
+ * BMC's "mac3" is connected to BCM53134P's IMP_RGMII port directly (no
+ * PHY in between).
+ * Although BMC's "mdio0" controller is connected to BCM53134P's MDIO
+ * interface, it's only for debugging purposes: BCM53134P always loads
+ * configurations from its EEPROM, and users should not configure the
+ * switch through MDIO interface in regular operations. As a result,
+ * the MDIO connection is disabled in dts.
+ */
+&mac3 {
+	status = "okay";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
-- 
2.37.3

