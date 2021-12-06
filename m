Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E796B46AD7C
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Dec 2021 23:52:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7JbD60RVz2ywv
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Dec 2021 09:52:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ZnSxnSOO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ZnSxnSOO; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Jb75CSnz2xXs
 for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Dec 2021 09:52:02 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id p3so11326193qvj.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Dec 2021 14:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oimzPdENQiMl9fABHsD/hSKDeXpkMF2Ol/l4UxA1adI=;
 b=ZnSxnSOOzGKmCxXJJe+326847cQ2mOdjA54lgbnFe98LNn5NicUQjkv/gZmURoJlLp
 NTYXr+qtC9a0jRTDr6v8tYFex1tb/wyF/IffF4P0TmFnTK1YUUCkwDVU01sQ43ocW4Xu
 HaVXB7kET0l73RbDo/EdNjcEqKRR41U9iT1ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oimzPdENQiMl9fABHsD/hSKDeXpkMF2Ol/l4UxA1adI=;
 b=OKIaBCVb0C0DKxhjbJ9HeI7WgROpigAV8dyHJS2n0Qu6KAAaWAmIr2+cb3zIQVpNlo
 7TY4TQ6Ke1XRTvrQb54gWJOUeT67T9gjHUCWmDgXxsK4OdZeoKcdJ3YtNkFfiE72PPPA
 2lX1HcU8owfnyG+wi/3AUVmNC6lkH4pP37kpLIkQZjKGRSbMAaw9OrBbR+ZjpGn3wWAz
 dyJe1bOp46LHnNlTiXDp9DDgxNKyPrgscak6qLdXKKqTfdEoM0S2VYIvQPV3Rg46DDhP
 o7Y/Q6Ynx2uDb/OcAqHBzvQxMxBSyz7lPwQmMiJe86FaCocO0TqGfL9cE2GNtuq1pRxl
 MjrQ==
X-Gm-Message-State: AOAM53099933TJ/lZc7eYRMmAHAY9fvSDUHpMxJZ5eDRc0MR4kLxhRvk
 yEnflhajSiVd77UdYnRU9snn1ysw1cSqhyAnO7I=
X-Google-Smtp-Source: ABdhPJwsWtljRtloMBy/nfiuFRYja1NNoa0XZcTHeRYj8LCekz6T0FBQdBLEpUwA+gpdZZ+w0JiXyKR92W4AskOR8as=
X-Received: by 2002:a05:6214:c6f:: with SMTP id
 t15mr41090372qvj.49.1638831119274; 
 Mon, 06 Dec 2021 14:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20211201033738.121846-1-howard.chiu@quantatw.com>
 <Ya5/v+VhOM9o9BtQ@heinlein>
In-Reply-To: <Ya5/v+VhOM9o9BtQ@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Dec 2021 22:51:46 +0000
Message-ID: <CACPK8XdCjqB+HZ_g9O=gjnSne3=iV44i6jKP5M8yWcsjnttaog@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: dts: aspeed: Adding Facebook Bletchley BMC
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Howard Chiu <howard10703049@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Howard Chiu <howard.chiu@quantatw.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 6 Dec 2021 at 21:25, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Dec 01, 2021 at 11:37:38AM +0800, Howard Chiu wrote:
> > Initial introduction of Facebook Bletchley equipped with
> > Aspeed 2600 BMC SoC.
> >
> > Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> >
>
> ...
>
> > Change since v2:
> > - Remove uart5 workaround
> > - Remove gpio nodes of pca9552/pca9539
> > - Modify gpio-line-name of led/power/presence pins with openbmc pattern
>
> A number of the GPIOs do not have defined openbmc patterns for them yet.  The
> names you have chosen are ok for now, but we will be changing them as we refine
> development of this machine further.
>
> > +             gpio-line-names =
> > +             "SLED0_MS_DETECT1","SLED0_VBUS_BMC_EN","SLED0_INA230_ALERT","SLED0_P12V_STBY_ALERT",
> > +             "SLED0_SSD_ALERT","SLED0_MS_DETECT0","SLED0_RST_CCG5","SLED0_FUSB302_INT",
> > +             "SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","SLED0_MD_DECAY",
> > +             "SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","power-host0";
>
> Such as these...
>
> > --
> > 2.25.1
> >
>
> Otherwise,
>
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

Thanks for reviewing.

Howard, I'm merging patches for v5.17 but I can't apply this until you
fix the warnings I mentioned.

Cheers,

Jeol
>
> --
> Patrick Williams
