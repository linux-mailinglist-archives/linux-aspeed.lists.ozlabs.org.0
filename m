Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A6D6D738D
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Apr 2023 06:56:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrsmD0Ccfz3cFw
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Apr 2023 14:56:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YmBTz2LL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YmBTz2LL;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Prsm71p7wz3bW0
	for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Apr 2023 14:56:23 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id b20so138081919edd.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 04 Apr 2023 21:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1680670577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UaAvYvt5g6xXavruYf7/xZ5mYZyDGi7n10kqvlr/XQY=;
        b=YmBTz2LL6zsbKvAxNuWuYkm2ASVpLGWRU1Nykv1/CbBACrGHhN9MTCFv+srHqQ7I0C
         ZdgzuR68WHuMjZSZ+R0ieAYsCAQL2dX1Pc/NxK+PshHM9vcV957D/dTG61g1rdTeiqtF
         Aw0BGsOUmHdnPTrXepVUX2H3PbtHY8aLxPyj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680670577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaAvYvt5g6xXavruYf7/xZ5mYZyDGi7n10kqvlr/XQY=;
        b=iS4fa7QFQlDEG2RqMM0b9AbNSW0j1xm1l+4d0RH3z6fFMvHSJ1TMrcAst9b7l1+r9x
         hYH8/VxydAzr48AAPnpZtkf0yKMF/JNpsNxlAg39zZ0JhrvZKroeTmzoGfa3YvM4Tjx9
         6NMWjQgBs1yi6DkVb3rTC3WKSCqeq64Po2Y0+dzfXosTKfeNUYr+chMFg8RK6IZhJEM0
         oQ8pnkivjSSleUUe6mnbJgAweD94OcPPRdsiEFmlfCiwk8Kge5Bxdg3mWeO1qQReMLA+
         9eVWhyGwehyyd4Ql41mGaPpV5P5jUWJEbWuH4CmePYhCbYifUX2qZ912tey72Y5izVZy
         ox1Q==
X-Gm-Message-State: AAQBX9dyu1rlBHGo+NiycNYBzIME+KzTuq83DZJitd1RMJF3S3IfKy9y
	kQXN/tlb+x8xViBS+8OkvgAtjnWfMckrAbhWYNk=
X-Google-Smtp-Source: AKy350ZlXT+2/CbTi+BHrk0i9bjldcN5n2yS+gUKQt96ZoJPbwZHOUmmTolZYRVNrh/eU4b7rNycV+/k2lCYj/TW8DU=
X-Received: by 2002:a17:906:e41:b0:933:1967:a984 with SMTP id
 q1-20020a1709060e4100b009331967a984mr891245eji.15.1680670577207; Tue, 04 Apr
 2023 21:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
 <CACPK8XdLpg2H4a2nHo4PokfBc4r3D8MbK2-62jXkPXAq8Q03Rg@mail.gmail.com> <94e941a2895bbb40d7b87acd7de6525b8596b096.camel@codeconstruct.com.au>
In-Reply-To: <94e941a2895bbb40d7b87acd7de6525b8596b096.camel@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Apr 2023 04:56:05 +0000
Message-ID: <CACPK8XcPBCppbF8smOsO3csiWoomgheLHcudyNON3QDrwyguOw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c controller
To: Jeremy Kerr <jk@codeconstruct.com.au>
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, Jack Chen <zenghuchen@google.com>, Matt Johnston <matt@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 5 Apr 2023 at 04:34, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joel,
>
> > Given we have acks on the bindings, I think it's safe to send the
> > device tree changes now so we can merge what you have in the upcoming
> > merge window. If there's changes we can modify or revert.
>
> OK, I'll get those into shape.
>
> There is one dependency on this though, and unfortunately it requires
> solving *two* of the known-hard problems in computer science:
>
> Do we start at i3c0 or i3c1?

I'd vote for i3c0, like we do for ethernet, i2c, spi, etc.

It is annoying that aspeed chooses to start counting at 1, but at
least we would be consistent with other parts of the kernel.

Starting at 1 reminds me of doing matlab assignments at uni, so that's
another reason to avoid it.

>
> [i3c1 would match the schematic...]
>
> Cheers,
>
>
> Jeremy
