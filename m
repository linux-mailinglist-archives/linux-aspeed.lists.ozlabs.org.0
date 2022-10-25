Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A69160C1D8
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 04:43:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxGTP3SXVz3bZs
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 13:43:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o/rfZHK9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o/rfZHK9;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxGTD16Lfz2xjj
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 13:43:11 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 3-20020a17090a0f8300b00212d5cd4e5eso9183984pjz.4
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Oct 2022 19:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mV+GmkM5T+Z4YGFSVgtClSbjpVnm7tENAQZ0qymGquE=;
        b=o/rfZHK9lBRIPYU0h9n8rn/cmxibbkidswYdgOYctV33CCbkpjR45aK58E9qHNDVTZ
         YXqKjXynSwKH81l7CyztTBx1+7b6aLnyWZJVaiSsshXznCRBK7xvKzKZpf2pTM5s0KIQ
         OWhqsKHpTs5OU64XRIVEP6bVCHok0ZBRg0yI11+84VW9EbqQQ8BoFRXmNN8Ok3TQrpZ2
         RuEvslDRrRcA7d+MH9qGQ5EnKEjht++ylGJxuGrpKRTiLta8e99xboE4oMWHLAeG5JOS
         +SkC+ekpU8SqAnztMFUH4x4Ex5n0+pErx/bCLh1IAU31rE6ai4To3Wu7bsG/4ufj51Zh
         PqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mV+GmkM5T+Z4YGFSVgtClSbjpVnm7tENAQZ0qymGquE=;
        b=rRbXysNIOTPBkYdhYi9BSWhst8BNP+S/nLHzmI+9/w8YM9viwOdfgLF6sGNdM7CalW
         rtY1glfwaebo2kVSLvjRRlhE0N/wFYWPpZ9FRaHcxY4qlScIL3SpFP+obQDiSbar9FeX
         nMn4vvt74HRFQcxm5WIixc5SlgbXQC5uO1xSmca/xnDV1g9HVbDn/8iHJ+ZQuBCa3ohf
         AN1k8t3rkjV1GaK7NQvfR9q8/C7C+7jx06HyhJYCbF+jjzOdoiXwCelNKJE/v4mYKXkT
         yBvBJstxxIf2bPFQpO139cxg+WIxsqpcyeGpBlFFWOSIKNwCLpV/Ilr+uxWE/ke2duHF
         9yOQ==
X-Gm-Message-State: ACrzQf1Z4iG7BpWgdYXDfUhb+dP4r2e7+5sVucY18NrT/7DpKpA7nCn9
	50Nd6r+1te/GKijZ8dEm448=
X-Google-Smtp-Source: AMsMyM6Gn9mitFHKGNaBOVjMemkrZDCwBoVXWp3zLOWC+8DpJz3H3JZkZk3J8nbXfblaGsgUI2XRww==
X-Received: by 2002:a17:902:e742:b0:17f:6a44:ee4a with SMTP id p2-20020a170902e74200b0017f6a44ee4amr37219795plf.103.1666665788091;
        Mon, 24 Oct 2022 19:43:08 -0700 (PDT)
Received: from localhost.localdomain.dhcpserver.bu9bmc.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id p12-20020aa79e8c000000b0056befcd7958sm458516pfq.84.2022.10.24.19.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 19:43:07 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/1] ARM: dts: aspeed: bletchley: add aliases for mdio0 and mdio3
Date: Tue, 25 Oct 2022 10:41:45 +0800
Message-Id: <20221025024145.1561047-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add aliases for mdio0 and mdio3 so that we can use name to lookup the
address of Aspeed SOC.

For example:
root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio0
/ahb/mdio@1e650000
root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio3
/ahb/mdio@1e650018

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index c02c15f15465..2825d5f3f78b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -15,6 +15,8 @@ / {
 
 	aliases {
 		serial4 = &uart5;
+		mdio0 = &mdio0;
+		mdio3 = &mdio3;
 	};
 
 	chosen {
-- 
2.31.1

