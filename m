Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDAF8A2AD0
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:18:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZKrfYJ27;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9wS2BXhz3vZh
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZKrfYJ27;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9wB042bz3vb8
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:17 +1000 (AEST)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5aa3f0fcd46so426012eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913495; x=1713518295; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mmt0UdSDV+w1BWZtmNFxfAxPy3KjCbVYZPCzBNdDlQ=;
        b=ZKrfYJ271aHuwxnHbUmdYJ7sK+/1F60JndXuFAqzhVIZaFmVLCCT7atcK+BLNUJ46v
         8IGKnStxkuvOEiz+5WtulJ8AUapkxlIawQCbWiQGB5tW/h94PqfzCEeqWlLZanPTlNBH
         uwIDa7CAlIi70h1b4mFr6fJ3Sgunv4sDeMeKXkwNFCVKhixgqE8ovmQclf4KhyXECSxV
         HOx5o3ZnNLZgzMBX+z0VOMcpYjCh9k3RVYk5iUnfwgETfOJ8kgYkE3bK6q9/wCb9esSg
         je/5lnOvouiBOUlOdqFF7O91hv0KVp3G9POYDMuNCX6SVgZ6cx8Xvgyx15BA1ycXUokm
         dPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913495; x=1713518295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mmt0UdSDV+w1BWZtmNFxfAxPy3KjCbVYZPCzBNdDlQ=;
        b=NXl+ze7Tx+ex+leIZsGrHKEUCww8ooyzr2wDbzC2JzWd07aiH7+kwZ+qk5pqn+Fjnb
         6AkC+Tp6+lcbcPjHEyWa0F67v973EUWXsXcsmRIUeMX9m4vMFZ35eUze+/lm0VpnI6m8
         jaAT4U9M3n1L2xKs1hAZd/nVlVSGy9OVAY2ouJPtw8d5JL2PHqiaEq3jDbH3ZRpu9UaU
         3gCVvKzp278C8lwUIwASlMUAJzJzxL50PVyirzzAElMk3C9T07BNMn0VPVtprJ9UBXaW
         0+qOqGg88k+a/VTp8p5NpZiKPO6b7CxVhMz3MfPk2TmelJbDdx38PyLXv7k4Lwj6x5f9
         jcAg==
X-Forwarded-Encrypted: i=1; AJvYcCUheDtCU1An/HyvJkYPSdpGHvBMwwTKSWdMelB4L9xdF9HunHBXZBqHSbOdUSsOzv75VSpd3iqGUZms+4e5DXbDYQbgv5G2wu2yq1xPUg==
X-Gm-Message-State: AOJu0YwXSW7Kj+4LspSD8z9sMXbfKuoyu/KzcD5rGm6Xy+z8uKMcXVtx
	nTX13lP9bL40BWm3lcaStvUeng2izdP4lft0pj+gS0g2/r7AQmpg
X-Google-Smtp-Source: AGHT+IFTZ+X0fi1cFZo+/AzTETlyhVl05mV1/xX3nQzSXyUyT5f8pq7FfXFJJb8hJrEzZy/Mxbq+OQ==
X-Received: by 2002:a05:6359:7906:b0:186:2b2b:c91e with SMTP id xc6-20020a056359790600b001862b2bc91emr1343502rwb.19.1712913495271;
        Fri, 12 Apr 2024 02:18:15 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:14 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/12] ARM: dts: aspeed: Harma: Add cpu power good line name
Date: Fri, 12 Apr 2024 17:15:52 +0800
Message-Id: <20240412091600.2534693-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
References: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
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

Add a line name for cpu power good.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 5d692e9f541e..36aad01dda20 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -501,7 +501,7 @@ &sgpiom0 {
 	"","reset-control-cpu0-p1-mux",
 	"","reset-control-e1s-mux",
 	"power-host-good","reset-control-mb-mux",
-	"","reset-control-smb-e1s-0",
+	"power-cpu-good","reset-control-smb-e1s-0",
 	/*E0-E3 line 64-71*/
 	"","reset-control-smb-e1s-1",
 	"host-ready-n","reset-control-srst",
-- 
2.25.1

