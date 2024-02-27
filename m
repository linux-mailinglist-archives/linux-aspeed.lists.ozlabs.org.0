Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E752986864C
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:47:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hskUHJqp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL3D59sZz3dXP
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:47:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hskUHJqp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL2y5cCNz3d2d
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:38 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1dca160163dso15395365ad.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998456; x=1709603256; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mmt0UdSDV+w1BWZtmNFxfAxPy3KjCbVYZPCzBNdDlQ=;
        b=hskUHJqpdJf504dYaMYn6IM3RfbSsUFI8+rwLaFMCOCUwAYERnEltQPmtkJ5Vq2AO3
         xgXHtOSF0ZnOk/7tKkzb2lnnKd+bRw8hH1I2JUwg4BBPl4bwypiFQTTs1BN0hLU0prGu
         vcPAMMnKFo7+ikxz+heY5dsFL9r+ypR2TwxEeO0NtBeCFZOvgaWWlOd3dhmtzsHlGOno
         8PZikr5u6RzI+Cogv3ufMG97OAkBkG9qvA5+Sv+FuQb0+w1/86wQ+SzGvJNdkfVsVLvc
         4LrwlXuo48MFEwo6Ca6vPdSK2BSs+uL3PsRrlgBXcW0J+rsqP/MQBjJDG0VMR4hxg37Q
         ojZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998456; x=1709603256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mmt0UdSDV+w1BWZtmNFxfAxPy3KjCbVYZPCzBNdDlQ=;
        b=PfZCDwyFA+5lDZdebvHa3CsPNrxD3gypmN8E06+NuCKmE2sWoK2MfaSBuSIqpVNB4R
         tai8SforCIeKBrPnGNL5tGN18AkNNqtBJtnlVdTz0W+KCYdz1rCJrVT4BzAzBArP30W5
         wfT2H9CJyUcji/08a8FMy0Tz3K04ZU8nxxwU7abn1s1wKHc+OgWygJR0Bisj37s/imlu
         9iIeMy+yod1TFVtjquSrZCquZQutwDIzRHk9n3DFuWZqDXBGRxUqOzXlwczeKu93QI7W
         LDTN5t0REYDW88WXpZ8WEk4gvFK6Kjn0j3O0ztm9FEbuvb/73Wey6dp8HX+m2xtOUwIO
         Od6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBKWaiICAezdbuEoI2KKRTVZqgk9fpOrLXtBJgHZaANFtLP03hbK1jhqFLiD/+50/a5M8sj8eIz3Pue2WiBtXxlQhkIoqA7sb/D7tEkw==
X-Gm-Message-State: AOJu0YycbuDc6s/eElW31YzslJG8qD89+jqVm8giFq7AqHpwEuUTiEoh
	TDgoXvEOKtC338Y16LWHXM4XRtMMlP6UKIJgSHhX2CYCVWQDneKu
X-Google-Smtp-Source: AGHT+IF/R8F2vCv8LwWiPNVhtvuPYrnqX7K+5pgbmlEmQC5kMGnDWfZijmTSEK7X7o7tnH0QeGVCtA==
X-Received: by 2002:a17:902:6546:b0:1db:aa46:4923 with SMTP id d6-20020a170902654600b001dbaa464923mr9339802pln.40.1708998456003;
        Mon, 26 Feb 2024 17:47:36 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:35 -0800 (PST)
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
Subject: [PATCH v4 04/10] ARM: dts: aspeed: Harma: Add cpu power good line name
Date: Tue, 27 Feb 2024 09:47:13 +0800
Message-Id: <20240227014719.3037588-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
References: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
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

