Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 748FA686091
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Feb 2023 08:26:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6D492Tsmz3cfP
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Feb 2023 18:26:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=cL6EEZS8;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=cL6EEZS8;
	dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6D410SMCz3bT0
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Feb 2023 18:26:06 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id p133so14975534oig.8
        for <linux-aspeed@lists.ozlabs.org>; Tue, 31 Jan 2023 23:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qXn8YvLc7wfEXI5vFtc33NHxxjtwjsNAOGS5qreHpPE=;
        b=cL6EEZS8MNorcG7mSX41wkRI8BR8mWiS+xY40vZZFx2DuywCFVd61LAmAMfjGVtzKu
         D4cPDBbBZoM3PA5LlTNUOzByo0VnI93o7UkOSd71hi/FCfthZ9OP8l+CGYvl1d6XDwaE
         MaOQgJG/02qa7m6GwHnUf4Ml7/aLB8a8axQaoTrURkUZZXcs/C9YSCz4Jm8KTBXv/tF0
         d2x8MQGFMuOmp1Vq6XGwAJ34m/dPv/7j/N1ytJ3RmxxkDFwacYTLIJKpFpOSIRtlRguF
         xVaCz5VGEpTp/J8XoY2tv8smYrq9GiUCDJzAwjFC4Ddbvb0de3pDX50Pv6dfJEsvYfuG
         K+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXn8YvLc7wfEXI5vFtc33NHxxjtwjsNAOGS5qreHpPE=;
        b=qFBKFcOuK7VBiL0WNDc9zCWCJHbHdfE+dEVEFy6fxm+vq8CXevbJuIog8XYZ/XuKKW
         ZggIuiR1OkIKF4Q8WvjeTeVtqpdOyWoKvE4498snS+vORaXeGeUoFh9owyJF5oCy4zbA
         YE4VltrMNYYFe4gJ/tWW8tEvdSzswM4G2+SxAyVkwaU3hJ4qbwJ6LXZqf6CJ1CXU6bqk
         0e8GgnK5FebvOpJXpd5j16gHrZG0cVFP3gNH1YNaDsxH2JhvHBfT1BXpmf5eVHTHHn2j
         tlbaSj/R0vSh/K89GIpoTAJaig0JId/WQG+wlIouOoB5qzOUEg0bGar9q342yrkFh/Ox
         nowg==
X-Gm-Message-State: AO0yUKXr4UYT4eOAClL7YKdZ4JFMDlqp55O+fLz41yr6r9nOiYvespXa
	gs8oSKCr/eiqsLT3mdi5//9QftvQfBpEtPgssCRB0w==
X-Google-Smtp-Source: AK7set//uWq5+H+SkpL7GYpussphKlKfUl/mCfcWI54aiDISn4XGgEsTj11TRIXogRd1jwIetIRWjg14sObGaOFVxnM=
X-Received: by 2002:a54:470d:0:b0:378:7c48:f8d6 with SMTP id
 k13-20020a54470d000000b003787c48f8d6mr92029oik.166.1675236363478; Tue, 31 Jan
 2023 23:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20230119102102.73414-1-jordan.chang@ufispace.com>
 <20230119102102.73414-2-jordan.chang@ufispace.com> <bc2329ec-bc3c-51ff-5738-51d2c78fcdc0@linaro.org>
In-Reply-To: <bc2329ec-bc3c-51ff-5738-51d2c78fcdc0@linaro.org>
From: Jordan Chang <jordan.chang@ufispace.com>
Date: Wed, 1 Feb 2023 15:25:52 +0800
Message-ID: <CAJ3czeRe+NgWYWhRfZvr3NJFm02H382+04uRYG0fpcgYtyjFhw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add prefix for Ufi Space
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your comment. I will resend the patch.

Best regards,
Jordan Chang


On Thu, Jan 19, 2023 at 6:57 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 19/01/2023 11:21, Jordan Chang wrote:
> > |This e-mail is confidential. |
>
> Sorry, we cannot work with confidential emails. Everything you send to
> mailing list is public and must not be confidential.
>
> Best regards,
> Krzysztof
>
