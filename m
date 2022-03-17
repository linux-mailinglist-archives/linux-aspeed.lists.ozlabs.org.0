Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C481D4DBC27
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Mar 2022 02:18:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJq5n490Pz30Dh
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Mar 2022 12:18:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bCWEuu9t;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=bCWEuu9t; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJq5g6lF7z2xKK
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Mar 2022 12:18:13 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id kj21so3207698qvb.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Mar 2022 18:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B3/Zb6dWqTjucFfwyqJe9d5nv5unSJBHO6UrUJxCnSo=;
 b=bCWEuu9tf6HdTODZwO24DXPmBGMlmBbFJFOh6gUAocW5CCpvt44APDkjwmpkwXdYAd
 In5y4sHoZCoDjCwx/7q6V3Ls4JA9N4pc1gKKNte+Gy6ILNomtmGZmlDy4YeZvagfXNn+
 x45TK7Cu7Ahb/eNxjF5gu/j31YdNrXgLhUIgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B3/Zb6dWqTjucFfwyqJe9d5nv5unSJBHO6UrUJxCnSo=;
 b=MglSqzU2zdaKrl//Ftb54rJMp+/Lgo7HwyEIgepc5cq6VFbSLxTHkc5uFfKGUqudFY
 Al1/H4AW39XeJeCdDJUPmW2NQgAdbcPtD2w+pBABIBfGMG1CPrs6vyhXZsGcaeUjYGDR
 up/oPViRkauMiz3BiRTYL/gV6SK1o8br3WITx3Z4lxaDXOvfZRZ1FWWQ86iExbUAOr3W
 MxHarbWTQKyzdKaIMOjWDAGJt0DpiuDEL7BQX90Cu2LQfTJWM8xLLbe8/+QtjqiEoFEC
 tV4kD+O00fW4kfqQGvu/sPs8HPYxzEJqK7KG05vdHd+A/0C5hcrPHMNnCMNsqwNMYV4A
 zK9w==
X-Gm-Message-State: AOAM531PZ9FFvn9pjPDrraL1SqEk5MnMqlNlq6QF0A+VjZ19Vcsjrc6u
 cEiJB2DYoY7aQgoAA7Rz1mO25BzzVOvdUF7llLI=
X-Google-Smtp-Source: ABdhPJyogCwUsCTWn79Pjurh1J5wIA5vUEldxxZvi4ZqNwaGDwj8gETdwK6oH35IrSdfb2DTy6pr1U6d9b9xX09SztU=
X-Received: by 2002:a05:6214:c67:b0:435:bbb2:5c40 with SMTP id
 t7-20020a0562140c6700b00435bbb25c40mr1778258qvj.21.1647479889902; Wed, 16 Mar
 2022 18:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220308003745.3930607-1-quic_jaehyoo@quicinc.com>
 <CACRpkdbFNLLve1-JntNW=eMT9ivZTZHBk-xpwK6w-kE0fczr+g@mail.gmail.com>
In-Reply-To: <CACRpkdbFNLLve1-JntNW=eMT9ivZTZHBk-xpwK6w-kE0fczr+g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Mar 2022 01:17:58 +0000
Message-ID: <CACPK8Xejcvv37uhGUXOTrbXJ=0O17tiDNizo9jtbRqHxyFiLhg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix AST2600 quad mode SPI pinmux settings
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Jamie Iles <quic_jiles@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 17 Mar 2022 at 01:11, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Tue, Mar 8, 2022 at 1:37 AM Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wr=
ote:
>
> > I=E2=80=99m sending this patch series to fix current issues in AST2600 =
pinmux
> > settings while enabling quad mode SPI support.
>
> Patches 2 & 3 applied to the pinctrl tree.
>
> Please funnel the DTS patches through the SoC tree.

Thanks for jumping on this Linus. We're not sure that this is the
correct fix, Andrew is still reviewing (see the comments on patch 3):

 https://lore.kernel.org/linux-arm-kernel/CACRpkdbFNLLve1-JntNW=3DeMT9ivZTZ=
HBk-xpwK6w-kE0fczr+g@mail.gmail.com/T/#m2cdf4f8b55427d6040f5c13eb85dd656f35=
79c48

If you haven't pushed it out then please hold off. If you have, I'll
let Andrew jump in and recommend the best course of action.

>
> Yours,
> Linus Walleij
