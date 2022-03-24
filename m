Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9EC4E691F
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Mar 2022 20:11:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPZZt50Wwz30BK
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 06:11:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=weWqZdGO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1135;
 helo=mail-yw1-x1135.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=weWqZdGO; dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPZZm2yDbz301s
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 06:11:25 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e5827a76f4so61353317b3.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Mar 2022 12:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nzI2Ptra96kLBKRjEaED+zGkgY7+4rTTAppT9oSKNJg=;
 b=weWqZdGOagSSdbx8MBQitSlj+RV3DvRUBmB6zRGph1kdYeAHCYc2JtIfN96JP7c3IJ
 oILG6ewHmmWiRtqDUmgGAEWyT4b3KnTi9VNJFfEs0XBY5/B9b+fqRGaJre0ZCVFm2w1Z
 pCKDbSDBGsGhmYnDAwiq/nuRfcfXB0N4689EWt3gVmtV3pjupoCtWyUNxLDw9ndVVXfe
 UBUedEjjdKsf1eIBfj7MnsXmSJ6k8C+SOI3PW9EP4k/wk/tMCf6RvBVouV/VyuzioaUM
 Kcq9aoThof47R56iAs0jTRZbMQXE/Sv7WnuLjGDgSrfjjEM0ED4YdZwyKqyuushmoTC2
 CtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nzI2Ptra96kLBKRjEaED+zGkgY7+4rTTAppT9oSKNJg=;
 b=5EGy6JGoJGME66aTT7Pw/n0H+whJVrrDhmAa80Ejg5EAQBosbFK8aY9YL/p2wFRLLq
 1kon3YuRTSWvU72HZpFI0Tvds91nuQQ1nfR5SkUeSNebYd3PM6QlTnwHaAl0gfozKuZN
 QVdv+tqurgPxnIp0yfaqO17mZ4xeuPPXGWVEkHzqeqU0wcn96aP0gvgynFyHvBncVmCl
 5dQ7k8HqKTQoKqT1637ZyKWHZm9tWekMlM3kqODaJ5gotLS5areWtC69v+Bm1day+Kq3
 eEPwGYjcNksTsXBHzvNVfRLV4/NGibTXi5u9s9QL+/10G2hW9gRq/LQqCjCVF0MkYA/I
 DMOg==
X-Gm-Message-State: AOAM533kikZ5oZv8LyPBKPSRWllOnWOHaj/4jyxI39g2mxw44d0j+vf9
 74THax//xkk1xHfpkURXkkpmnMujnQxaDOtbVormxg==
X-Google-Smtp-Source: ABdhPJwGqpU6WKxIPdYbC87irVrC94guHnyeitOgVL8saG6LpgunCTzt36BGTJcLpTbXgk2xQ6Z5ANo2sxioQlWx6hc=
X-Received: by 2002:a0d:d68e:0:b0:2e5:9f48:a24a with SMTP id
 y136-20020a0dd68e000000b002e59f48a24amr6650614ywd.151.1648149079903; Thu, 24
 Mar 2022 12:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220308003745.3930607-1-quic_jaehyoo@quicinc.com>
 <CACRpkdbFNLLve1-JntNW=eMT9ivZTZHBk-xpwK6w-kE0fczr+g@mail.gmail.com>
 <CACPK8Xejcvv37uhGUXOTrbXJ=0O17tiDNizo9jtbRqHxyFiLhg@mail.gmail.com>
In-Reply-To: <CACPK8Xejcvv37uhGUXOTrbXJ=0O17tiDNizo9jtbRqHxyFiLhg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Mar 2022 20:11:08 +0100
Message-ID: <CACRpkdY72b3PWsmi98Fsirb3wVkskSpRhg+Anzf3xPSsa3EXZw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix AST2600 quad mode SPI pinmux settings
To: Joel Stanley <joel@jms.id.au>
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

On Thu, Mar 17, 2022 at 2:18 AM Joel Stanley <joel@jms.id.au> wrote:
> On Thu, 17 Mar 2022 at 01:11, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> >
> > On Tue, Mar 8, 2022 at 1:37 AM Jae Hyun Yoo <quic_jaehyoo@quicinc.com> =
wrote:
> >
> > > I=E2=80=99m sending this patch series to fix current issues in AST260=
0 pinmux
> > > settings while enabling quad mode SPI support.
> >
> > Patches 2 & 3 applied to the pinctrl tree.
> >
> > Please funnel the DTS patches through the SoC tree.
>
> Thanks for jumping on this Linus. We're not sure that this is the
> correct fix, Andrew is still reviewing (see the comments on patch 3):
>
>  https://lore.kernel.org/linux-arm-kernel/CACRpkdbFNLLve1-JntNW=3DeMT9ivZ=
TZHBk-xpwK6w-kE0fczr+g@mail.gmail.com/T/#m2cdf4f8b55427d6040f5c13eb85dd656f=
3579c48
>
> If you haven't pushed it out then please hold off. If you have, I'll
> let Andrew jump in and recommend the best course of action.

I just dropped them again.

Yours,
Linus Walleij
