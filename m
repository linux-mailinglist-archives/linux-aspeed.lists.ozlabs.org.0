Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D8554534
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 12:18:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSfVP3RFWz3fCb
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 20:18:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W/Xu2zxu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W/Xu2zxu;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSfTP32pXz3f2R
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 20:17:45 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id cw10so9425941ejb.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XDIAIfYa1wZqErTQAQkY6lDsvB17Bzjh5kLg7XbRCyI=;
        b=W/Xu2zxueiM/FDUQIKaAR+o3BObdZNQyJiX6J9XHRUZtZDEVlN17qP2SXvXqaBhYIs
         7sncquN2cz3Y/TVhVA44GazQhED3ZhZozXP3NsC/qPOlI+d0ncOa8727LRmI/b2Xd+BI
         3C0IcvvXicr/5BGlNfV1szDlT00GC4Yh0IloR+UYNQUX+R3KjZnT+J8jOkGdEYErXh3s
         G6xHQMNzQbbEYuGBSxdTF58KcUrVxVMlewjw8EsmLrXJMIWplC8ocC2bHMivswYDtvuH
         Bytul0gwd06pV6PToxY4yqo/CAKt6eT4v8ReJ/c+HkyfLYReUc1IovfuoOpYTsVc6992
         WAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XDIAIfYa1wZqErTQAQkY6lDsvB17Bzjh5kLg7XbRCyI=;
        b=xbv10ehzqPITgXSyjlDOdcN44JDsIAvz/FtHrcFyDi/PT1T4xg0kGpFpBiXYMZ5XdF
         NO2yt9cDSPJdNRtTi9I4nmHcldyANRlEzn4YNJCIG13dg3/6RnSwRPh9l/dFLsBqjBgw
         +7E+OVaHSK7+vsuv5wKQE3CenlhPYCAHkD6F2+MHJxUL/Pg4KMyc06ckN2Falg+XVhb/
         k4LazWtMeOx2wru8ngSr3G6XOGObE+KC1283gLF+4hOQ16rZzi9T6kAlNR3Qy5rewd0l
         sCd89fNK++Vnl9aL0J52f/wYBev6hJqjN2r3hlzrpEiRhQXkBDakUvQawhmqnDWgs/W8
         kayA==
X-Gm-Message-State: AJIora/69KIPE7PAwqdZfJgaRTESxw1v5cJ8Tv+2IWtuJ1e/mgaMlDgf
	7XY4dTwsqoqkS+aTDHkpqUWMiA==
X-Google-Smtp-Source: AGRyM1sW1vCW/gmsXrvOjh2leCLICnUswRvl8RG/IIW3duvVzkOlgQgDHclcqDqLgTYcrv+n6uVDGg==
X-Received: by 2002:a17:907:968b:b0:70f:30b7:9324 with SMTP id hd11-20020a170907968b00b0070f30b79324mr2467406ejc.19.1655893062296;
        Wed, 22 Jun 2022 03:17:42 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ky4-20020a170907778400b006fe921fcb2dsm9028707ejc.49.2022.06.22.03.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:17:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: steven_lee@aspeedtech.com,
	linux-kernel@vger.kernel.org,
	andrew@aj.id.au,
	joel@jms.id.au,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	chen.kenyy@inventec.com,
	linux-aspeed@lists.ozlabs.org,
	robh+dt@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: (subset) [PATCH 4/7] ARM: dts: ast2500-evb: fix board compatible
Date: Wed, 22 Jun 2022 12:17:36 +0200
Message-Id: <165589305701.29629.1874683425220257656.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529104928.79636-4-krzysztof.kozlowski@linaro.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org> <20220529104928.79636-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: David_Wang6097@jabil.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 29 May 2022 12:49:25 +0200, Krzysztof Kozlowski wrote:
> The AST2500 EVB board should have dedicated compatible.
> 
> 

Applied, thanks!

[4/7] ARM: dts: ast2500-evb: fix board compatible
      https://git.kernel.org/krzk/linux/c/30b276fca5c0644f3cb17bceb1bd6a626c670184

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
