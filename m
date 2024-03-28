Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D8C88FAED
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 10:17:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ktr5Y/qp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4ybh0pGkz3vZq
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 20:17:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ktr5Y/qp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4ybX3Mzcz3cRd
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 20:16:56 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso711573276.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711617413; x=1712222213; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W275z/IWuD11PMCB9o4TcgDN428EIWjLe3KPPkx6rzE=;
        b=Ktr5Y/qpC37PAlvMkg2R64NvBzAkTJbsctFIa5vh2Eb5veThcWcAAdSwcJzTUTs8D8
         PrxuMPvuFeRakHiZfMRvN8SPd6ut8OZaJfM2eKCPFm1WhjzqJ8XxiFD+fJY+V1x+sPk0
         LpOELS0136y0fObD6j1fMUhy84OFdG3B1bSclZoLRQI704ZXv3Ae6rbdwMtK/cLVMM8L
         5JaNh+ebFeIu6k4ODGrt4eFC8lES86PeoL4vpBZn0kk9VfB12zbex0VCuGZn0aHKcyhc
         vTDCDq47PpA2I6QlGi6ROetSyCCzBMrCUD+DPfZDfgXTlLRRc21NDtzfr0FRvHMGZ3et
         pM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617413; x=1712222213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W275z/IWuD11PMCB9o4TcgDN428EIWjLe3KPPkx6rzE=;
        b=gEhahgjihjGKAvDKFzM6HmChTJnI+9+dTmjVDflLZYEWPI4g1LUo6++pTsVr36J5jY
         VPTCnS68tcgmyW3lz7TikHIYZ0wz5ssKhnBAvCHmuSPY61+IW78IuALUpQ025dKjFJN6
         /LrhTJs4bxK94VLFfQwpgLfuPAxIcXOlk6MnC7acazD+15iCChaex4CHd6n2uCKrdaWJ
         WTaUJoW4WXEDD71GcY/AbOXseglMoQL9wCrA0b+CCFMXZkIphKAIgYqjWFYWTlIlY3nS
         u2e63UwQwY2pvI++TpuiSnSyjvKFo0yRkJ1DwJnHldR8MJvGIQnPfv+DyFHfKeonHXf5
         0iUA==
X-Forwarded-Encrypted: i=1; AJvYcCUV7sutzLfnthYVgrO+JkUpvhx3DnnCxb7U4Mn5SR9wa3Bd45QCtcJzLG+XKNebvGBZCk8z/hvVSAzE+FOKCTaLf44RLz+5TfvmYAWPoQ==
X-Gm-Message-State: AOJu0Yz+FIulE50Aa0AobwtppQBsy46M/ev0eJegCua8kii0Xf7XZboa
	kwvOMR88aAKypat/xE9QhHaz+lJHJ231mjM64+tNvvWF39QtoFJg/GNQ/KBiq7aDIw65qlmh5Lq
	s/gAK4IEluh1ZCaJtKtwW9DFKt3rScT09l8/aiA==
X-Google-Smtp-Source: AGHT+IHRkTf8inGn2mE27T4DDRAM0a3h+ktBujX/BRlohTZAhDo+tStkRZRLPI58v2EqcZVGGY+9kbz/nNjf253kWd0=
X-Received: by 2002:a25:6906:0:b0:dd0:c2a:26f9 with SMTP id
 e6-20020a256906000000b00dd00c2a26f9mr2067038ybc.27.1711617413679; Thu, 28 Mar
 2024 02:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240313024210.31452-1-Delphine_CC_Chiu@wiwynn.com> <TYZPR04MB58539A1D94340F330CAF3CF9D62A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB58539A1D94340F330CAF3CF9D62A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:16:42 +0100
Message-ID: <CACRpkdZuSdkTXBF+4P1gMD4p4DsOJYivgrquuXas-R_UKg=JmQ@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: pinctrl-aspeed-g6: correct the offset of SCU630
To: "Delphine_CC_Chiu/WYHQ/Wiwynn" <Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Andrew Jeffery <andrew@codeconstruct.com.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 13, 2024 at 7:57=E2=80=AFAM Delphine_CC_Chiu/WYHQ/Wiwynn
<Delphine_CC_Chiu@wiwynn.com> wrote:

> Please don't review this patch since ASPEED also provided the patch to
> fix this issue.

I added your Reported-by tag to Billy's patch since you obviously found the
same issue.

Yours,
Linus Walleij
