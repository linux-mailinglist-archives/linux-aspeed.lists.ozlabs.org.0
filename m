Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E797686473
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Feb 2023 11:38:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6JKx3HTqz3cdG
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Feb 2023 21:38:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=6xUaW2l5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=6xUaW2l5;
	dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6JKR2MxFz3cgv
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Feb 2023 21:38:02 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id bx13so9536168oib.13
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Feb 2023 02:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V9HXHdBtE5H4bl8z/S/UD0KX8Uzi+CVOeWYp/70CnSU=;
        b=6xUaW2l5sWqpJ9TK3pv/glxvIHBTA8EnnmR+lTHKGUThsQKl5pk2G//7BD7YWy1XC4
         kfnM0sOkk6wZW8fZ0tVL8rtT3hSIvQudjtBaLzShMDy+OmCERyzmgKkjV53+fp9NFgwR
         4FtTNbTX90KlCL+IQX4+cSt1tWfq2npLAQtMryHUeZSmh07M84IVN/tAg/Ce1+x1jZ27
         VjuCrUvk9ImitmogqZUoWkIZ8v4l1Og7luvlxkY1oBrtrgs1jydber4iMOqzeuEugkmB
         5PzOQylKm3xsGSryk1ic3Plp6ZxKDf1vwvRhUjIZB0OggVXO4+XYbhQX/Ia7kYHKWMFc
         GIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9HXHdBtE5H4bl8z/S/UD0KX8Uzi+CVOeWYp/70CnSU=;
        b=swVBncAigAdyMcG6F7Dok7iTHB+FTcm55LUcJCb1XW7Hux5OXc6PXOP5MyBXiFAFXw
         f9nCa3eSrGpoPz+KUzr04VK4hP4Ve+xtuo8jO7HB56u6mX0gMjtqzBaEKNBrRRozBSf0
         6eXfdO005WvVMjcCV8zHcIQBYxBDbw1kAATiHh4SA2UBYCuEKmh2lksL3JTWnudKNG3G
         kKxsQ0aXl9i/heu6d/IXNXNDCVO+YNTt2hu+OYAE/tf+VEuLXoFaet/Oe5PMRpfoAbOT
         Qaejb+hxupGu1rl1gc6Yt1jOVOWiwo3Hhep4SVqS9aGxU1UIHWHNhwtcsjY97uikIHS2
         mOeg==
X-Gm-Message-State: AO0yUKUdFkX79PYxYtawPKEE9VCp1LA6NxWuj6shyPm91V03qdnXAIsI
	givxGSXzlbJCsrvXG4PyD6+JdYOaqf5OCsUfSCbtig==
X-Google-Smtp-Source: AK7set9uClQE84nhhdw56rlphOg08vTFoT3Prz55IEhG5el860pUruT6tsfWOA+cHt+lT7rtFaHQAc0KJmxs3Zn/kg0=
X-Received: by 2002:a05:6808:d4b:b0:378:7ba4:b818 with SMTP id
 w11-20020a0568080d4b00b003787ba4b818mr146767oik.144.1675247878050; Wed, 01
 Feb 2023 02:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20230119102102.73414-1-jordan.chang@ufispace.com>
 <20230119102102.73414-4-jordan.chang@ufispace.com> <3e242c03-f8fd-2136-0263-2306acb9f610@linaro.org>
 <CAJ3czeT1O3iw2S_SK3z0C6dMiJ+-fUrWXPox4LJpJkMy_rVsJA@mail.gmail.com> <307017b7-2ecf-2ce5-4031-27bb6f09feb1@linaro.org>
In-Reply-To: <307017b7-2ecf-2ce5-4031-27bb6f09feb1@linaro.org>
From: Jordan Chang <jordan.chang@ufispace.com>
Date: Wed, 1 Feb 2023 18:37:47 +0800
Message-ID: <CAJ3czeS7y6xj+DAJy66oujOfk73kAaJWiQsWAwL-4D2CaFimJg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: Add device tree for Ufispace
 NCPLite BMC
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

Thanks for your reply.

On Wed, Feb 1, 2023 at 6:14 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/02/2023 11:06, Jordan Chang wrote:
> >>> +     gpio-keys {
> >>> +             compatible = "gpio-keys";
> >>> +
> >>> +             fan-status-int-l {
> >>
> >> Does not look like you tested the DTS against bindings. Please run `make
> >> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
> >> for instructions).
> >>
> >> These will bring warnings. Missing generic name,
> >>
> > I have run the `make dtbs_check` command, and did not notice the warning
> > message 'Missing generic name'. It shows lots of compatible failed messages.
> > - /ahb/ftgmac@1e670000: failed to match any schema with compatible:
>
> You can run it with DT_SCHEMA_FILES=gpio-keys
I see. Will fix the naming issue.

>
>
> >>> +
> >>> +&i2c4 {
> >>> +     status = "okay";
> >>> +
> >>> +     psu@58 {
> >>> +             compatible = "pmbus";
> >>
> >> Where is this compatible documented?
> > Can not find the corresponding document.
> >>
> >> Did you run checkpatch? Did it pass without warnings?
> > Yes, I did run the ./scripts/checkpatch.pl and there were two warnings left.
> > - WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > - WARNING: line length of 104 exceeds 100 columns
> > I just ignore those warnings that Joel has informed me in the previous
> > mail loop.
> >
>
> Hm, is it then correct compatible?
I think it might be since it did not show the fail message.

Best regards,
Jordan Chang
