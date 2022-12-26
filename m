Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D350656039
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Dec 2022 06:48:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NgRdz1JXwz3bWF
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Dec 2022 16:48:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mvnKo8Dh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mvnKo8Dh;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NgRdk2mWqz3bT7
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Dec 2022 16:47:54 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so6821303pjg.5
        for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Dec 2022 21:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wEGGRHRkx/TYRoHQuQncfk8iOkoqIh2z64vF46qnf0=;
        b=mvnKo8Dht5BCyRbWOJ6vL4yn9X6VUG0JbqB3eNm8lm8pZuRyXvqPTdmHGWLb7j5yzB
         oLpOeYvyxk48FOQ4mbwf68Yvj57sUDZqE2FVmvyftvQsO7AeAyHcMigDWwm2zqLFCWeF
         /zmcTYHXXUopTq4fnuZBTTi4pt6PXjOAtWARo6FRbtykNX3a9YNZJriT9Hfbeiee8SsX
         heRXfpRv9rgMp2Lg5FtuyzvPoce3WVxILoi0VPVfISPPm+Nk5J58ldCo+bsV1O8LTEHm
         WKBzPon997+hnqDbNOXjY54l8/Bez+EF2k1Bb5sMAoZ5vPRBANnKu61nBzgMSzc1Dmrd
         XBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wEGGRHRkx/TYRoHQuQncfk8iOkoqIh2z64vF46qnf0=;
        b=N38EGRKka5X2aA4ABhqR+f6xPm0jNYtFsp2Ryj8mS0UaKqFQp4TNGsNG92Bp+n+XFb
         1p61lBrwG+SgAjEbHGWx+SR/shP9vOAXncFfoiQShRpIOzD9KUUSMwznCROXylwY/QWI
         yEzOxbyOaV0qYtjNff/ppk+pDwAp1a95OqInpNfMCkwC7no3e0SeqMTCF/dBCUZPBiGK
         YoHWkW7iWFeiw4ZyqOW/5W6Mev9H4x30BOlOmjCGldKMexAskJfALjiRi8D5Mogbpu28
         i6XdXgIhorLxVzQPPmOuGzrcOUXAJXS4i1LjNB1J83YX2ijElVK/9vQ23GRbwrPot5Ck
         XzlA==
X-Gm-Message-State: AFqh2kqYMvUzgL4YEGwMwAhFCgjd9YfF8jk+RHZjuzGev8jG8y2JLzdc
	V/c1yEkSTdO4pKaHBXXjx70=
X-Google-Smtp-Source: AMrXdXs7+NiJLm422uByXe9Fru36TSxkliQGdLRp8JIE/sc04ObaCwZkPx97G+RoodJZ3fwcZbCOmQ==
X-Received: by 2002:a05:6a21:169b:b0:aa:7346:2d94 with SMTP id np27-20020a056a21169b00b000aa73462d94mr22372940pzb.25.1672033672186;
        Sun, 25 Dec 2022 21:47:52 -0800 (PST)
Received: from localhost.localdomain (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id h35-20020a632123000000b004785d99321asm5618242pgh.86.2022.12.25.21.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 21:47:51 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/2] ARM: dts: aspeed: bletchley: enable wdtrst1
Date: Mon, 26 Dec 2022 13:45:35 +0800
Message-Id: <20221226054535.2836110-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221226054535.2836110-1-potin.lai.pt@gmail.com>
References: <20221226054535.2836110-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable WDTRST1 external signal to send a reset pluse to peripherals while
BMC reset.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 791f83aaac50..050ed7e810fa 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -1064,3 +1064,14 @@ pinctrl_gpiov2_unbiased_default: gpiov2 {
 		bias-disable;
 	};
 };
+
+&wdt1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+	aspeed,reset-type = "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration = <256>;
+};
-- 
2.31.1

