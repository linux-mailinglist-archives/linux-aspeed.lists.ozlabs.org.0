Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E99821705
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 05:48:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ic4MXuCd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T40j939RCz3btX
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 15:48:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ic4MXuCd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T40g56HLmz301f
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Jan 2024 15:46:25 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-781599b8f3cso462157285a.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Jan 2024 20:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704170782; x=1704775582; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mmt0UdSDV+w1BWZtmNFxfAxPy3KjCbVYZPCzBNdDlQ=;
        b=Ic4MXuCdL7da/AqG4NntLO6t0g11UHmwjP5A9ohRdq0tOc1OFjP7DTwD6ROre0dorH
         S+9xs6iHYtR5sTJcwz2kD5tRPRB+6a+RBlx97IY7WaEpcTlW/6D9pmOfAIj0tm35Ikdz
         EhpjzQDhpeyHINj+7DYpCQgCJIrVBO2EjJR3H5HAdrskSTRBhdf1bZHar7EF/nLEOaro
         JbB5/0uveFEkjCYEuchWzji7xwm7zxKB8LR4iwZZZoyJnbRyZuztFSpHTtR6aPwlmXhe
         8kXwFSKRnpFGGzEm3oLA5oKH7wl7rtZdPNsHWsaEWDscnSIowQ4Cy5KTMz5woiqfm13y
         /RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704170782; x=1704775582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mmt0UdSDV+w1BWZtmNFxfAxPy3KjCbVYZPCzBNdDlQ=;
        b=B6sjlVSVhEd68qHEZ+B2AqT869dnIwMEPDxYiEUhsnvqPlr/mWDgJ8j4s5O0GFe5Hf
         w8+6qThVzHuwQqC+iId8R1DHF1ok6QWmcLhml49pzbkoCbLftyX4RBjJv1co4Vi4c+FM
         m0sbPIAPiTfZIx4E0AEhHtNeAGs715TPcsuT3GupKurAmz21eWcdtCV/41ysHGURunZj
         nsqoPbIau+UZf9HwItSz43ONHYzSwL3rT6TSr5uamrZDra8FRHpGxTTGuCwCiDtI8fwW
         +mLNBCo+Bt899rTH9FzJDmz+/P95V4hJmqrbh1Bru2XrborZHtcDa3LBuVrbw0mmsfez
         DZYw==
X-Gm-Message-State: AOJu0Yz0cuBtOg+lEWJnh5i0MHd3YjJRTJAeehtRXACh9EmOaJD/eERz
	bHqItIVnMTEqOt8sx2DUcfg=
X-Google-Smtp-Source: AGHT+IFekV5ykuriyA0cyhHIsh3wYdvqjCWU5c4oxMfbMAa88xJi8Tq/V8wVvPx7CwejKkS8Ffl2Uw==
X-Received: by 2002:a05:620a:4ace:b0:781:bac6:e252 with SMTP id sq14-20020a05620a4ace00b00781bac6e252mr3738109qkn.8.1704170782408;
        Mon, 01 Jan 2024 20:46:22 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090abf9500b0028c2b2b76c0sm17308392pjs.22.2024.01.01.20.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:46:22 -0800 (PST)
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
Subject: [PATCH v1 4/5] ARM: dts: aspeed: Harma: Add cpu power good line name
Date: Tue,  2 Jan 2024 12:44:08 +0800
Message-Id: <20240102044409.3810873-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
References: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
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

