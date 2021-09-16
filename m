Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365140D22B
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Sep 2021 05:52:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H937y0Qs7z2yJ5
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Sep 2021 13:52:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iMEBrtz9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=iMEBrtz9; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H937s4k0sz2xXT
 for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Sep 2021 13:52:39 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id c10so5983633qko.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Sep 2021 20:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i8pdCgT8Dk9nwi5cOThdaZCDIas189n8MqwW6echK9k=;
 b=iMEBrtz94FcLe6yTN+V8qvN1F2TF07AfZN8/epMBz1JuEkvAACV3q1W+GVdmfo5r54
 bg//8MWY6mTmX9lQC2Kp25KUDBA1EPKA5JlE5ZvNPGF/W8cCJyS5CQg2Asy5KM8G0qP8
 j+r6IMN2id2P0wQtIbzl33v2wIQA2cOhsEYVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i8pdCgT8Dk9nwi5cOThdaZCDIas189n8MqwW6echK9k=;
 b=1bATzPId/p4XZZZQfA1c12x89JDJ1Ib4Wdi0cUwTy/CG31/5v57/+hsRoXwJjRHmjh
 hhytNwsLla1uIMl5M0pVP5cKavbd5k9e8ZQ0bbK5aEEJlEKMZAI7zXEP9g12I9RzX+As
 XpUAS9UM58VKMaRFyZ9aK5xg5Z9XrvYX0uM+PTheNK5atTXsvP2REgWaJVIMYlxZ4qF0
 RT6scXyrf7Zo/hvouEwIyl89XFVdbvjOB41TTCRRmSmpB4Nszl8ZaN0ut0+W1p4YCVLA
 7ftQ2iDDwSxVHYkJAePvVBfCceZ8T/qHK+vIgStjm31OuN3wmydkRe9BIUQ5WVagIBvV
 QDkw==
X-Gm-Message-State: AOAM530qX5WydI2mnSzRDww1QLKt8Vw5rATaPIOT18tmll7jitLz9w1T
 Fa5hx36AaC2ggYPpN/7mHFIzNmHoCDY815ToZYE=
X-Google-Smtp-Source: ABdhPJxoby/8H50notx6irHNgeSday5LPM9+rzgXxcx7N4BW5dKsUnLAMdsFv2lQFsB3wKXccEJdgJUW4SCIhBWwhqU=
X-Received: by 2002:a05:620a:140c:: with SMTP id
 d12mr3200243qkj.381.1631764356048; 
 Wed, 15 Sep 2021 20:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210831071458.2334-1-billy_tsai@aspeedtech.com>
 <20210831071458.2334-5-billy_tsai@aspeedtech.com>
 <20210905153339.751732cc@jic23-huawei>
 <20210905155029.3faa2c04@jic23-huawei>
In-Reply-To: <20210905155029.3faa2c04@jic23-huawei>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Sep 2021 03:52:24 +0000
Message-ID: <CACPK8Xe4KifkDxm0H6LtpCJZ1n07GLvxR_nF4Cfy5+4WXn9Z6g@mail.gmail.com>
Subject: Re: [v5 04/15] iio: adc: aspeed: Keep model data to driver data.
To: Jonathan Cameron <jic23@kernel.org>
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
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 5 Sept 2021 at 14:47, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sun, 5 Sep 2021 15:33:39 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>
> > On Tue, 31 Aug 2021 15:14:47 +0800
> > Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> >
> > > Keep the model data pointer to driver data for reducing the usage of
> > > of_device_get_match_data().
> > >
> > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > This one starts to be impacted by the fix (as its in the context).
> > Rather than making a mess of things for linux-next etc I'll hold
> > off on these until that fix is upstream in a few weeks.
> >
> > If I seem to have lost it (it's been known to happen :( ) then
> > feel free to poke me!
>
> Having taken another look at the rest of the series (and Philipp's review)
> please do a v6 starting from this patch.

I'd recommend against the practice of half applying a series. I have
just spent a good chunk of time looking at v6, and wondering why it
won't apply to any tags in Linus tree nor to next.

(It was made worse by the branch you applied them to not being part of
linux-next.)

Cheers,

Joel
