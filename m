Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8DD5ADD01
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 03:42:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM7R81QvYz306K
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 11:41:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fAn8Ca6B;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fAn8Ca6B;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MM7R11Ds5z2xHk
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Sep 2022 11:41:46 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id fv3so3658881pjb.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Sep 2022 18:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=wR4LPrjfekVqjvMATBzjqFfhUkvNlLUUdzUvMBxpESs=;
        b=fAn8Ca6BxfW8B6GwWQ+j/b2XZntmmRVgtRSpX6VUO92+DWvaZokWOokIDmpsUClAJd
         QKe8lYnSXvInKYIIgHyCLWyePb1+LeYdB04PGDobVVbhPtszGc7TssZgqqbwD46G5tOj
         iEDf9CWSO8WINiKJLraioNeM/tSh2oG5SDtqc9sBbD+ZpQD3zqBd2MGsomNU+3Eiq36q
         ignrLr71jr29mS75UAat2TLZVc29hJPp1Bl8rbbXCPTEKzmHrQ7E1nCH3CJZ9XzUUa3f
         vhOBzDg1ifmg7s7yXmSN3hahrP6nywPDxHy2wvpit2f+QmKPJAluwZBk1UXRWhmV8I6c
         Nu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=wR4LPrjfekVqjvMATBzjqFfhUkvNlLUUdzUvMBxpESs=;
        b=DQpfkt6Q4K88lJLI6jAZeA1lUNpJ7Z4vtiXJTqmdMCMEclPsg6bmNvQjZtlseQ4gmC
         KQgNydWVCJAD1tp+5Bxwi0KtBXnzZrqXN5PGDkPf01hxc5IUTm5mKEJxDy3XIOXndMnz
         XWMR1hcJtoRx58EvKTZuTFzMZfkYqTWvwq1ogUm7jOk4PqEj7uyZT2T/Zzf0WFNp14K7
         V4V98pw526A4TWOoqdzw3+E6cGg1P9mEfKgYuYFoGStXqoK5PDa9GyPu6iepXh4oTDLW
         zdrnAk/BKoSk3RBZp4E+UgVxbUJH2AjdRt3wqObVTiv5ipehbU1Gf3vNvIDYq3Mwsghu
         IAdg==
X-Gm-Message-State: ACgBeo0LZzNkODLDyPN5UEkHm/1JWkZgIj/hwHvXDVH8AU0vdOiQr55s
	cayrySuUXKbPDk51OIsJDiU=
X-Google-Smtp-Source: AA6agR5TgrDoVvwWAx1/PpDci1lw+560LvwFEWeXckFE2dCbAKtDFoQDxiEJOJP0QONGukRxKjeH5Q==
X-Received: by 2002:a17:90a:5aa2:b0:200:30aa:c773 with SMTP id n31-20020a17090a5aa200b0020030aac773mr12700964pji.182.1662428503955;
        Mon, 05 Sep 2022 18:41:43 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4 ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id cp15-20020a170902e78f00b00176ae5c0f38sm2935022plb.178.2022.09.05.18.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 18:41:43 -0700 (PDT)
Date: Mon, 5 Sep 2022 18:41:33 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 2/2] ARM: dts: aspeed: elbert: Enable mac3
 controller
Message-ID: <YxalTToannPyLQpI@taoren-fedora-PC23YAB4>
References: <20220905235634.20957-1-rentao.bupt@gmail.com>
 <20220905235634.20957-3-rentao.bupt@gmail.com>
 <YxaS2mS5vwW4HuqL@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxaS2mS5vwW4HuqL@lunn.ch>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Guangbin Huang <huangguangbin2@huawei.com>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Hao Chen <chenhao288@hisilicon.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Liang He <windhl@126.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Tue, Sep 06, 2022 at 02:22:50AM +0200, Andrew Lunn wrote:
> On Mon, Sep 05, 2022 at 04:56:34PM -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Enable mac3 controller in Elbert dts: Elbert MAC3 is connected to the
> > onboard switch directly (fixed link).
> 
> What is the switch? Could you also add a DT node for it?
> 
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
> > index 27b43fe099f1..52cb617783ac 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
> > @@ -183,3 +183,14 @@ imux31: i2c@7 {
> >  &i2c11 {
> >  	status = "okay";
> >  };
> > +
> > +&mac3 {
> > +	status = "okay";
> > +	phy-mode = "rgmii";
> 
> 'rgmii' is suspicious, though not necessarily wrong. This value is
> normally passed to the PHY, so the PHY inserts the RGMII delay. You
> however don't have a PHY. So i assume the switch is inserting the
> delay? Again, being able to see the DT properties for the switch would
> be useful.
> 
>    Andrew

Thank you for the quick review!

The BMC mac3 is connected to BCM53134P's IMP_RGMII port, and there is no
PHY between BMC MAC and BCM53134P. BCM53134P loads configurations from
its EEPROM when the chip is powered.

Could you please point me an example showing how to describe the switch in
dts? Anyhow I will need to improve the patch description and comments in
v2.


Thanks,

- Tao
