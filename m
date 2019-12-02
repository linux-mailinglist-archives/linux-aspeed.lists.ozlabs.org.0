Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B00210E9ED
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 13:05:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RP250X4HzDqMg
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 23:05:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="SUG7XFQx"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RP1w11kKzDqB4
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Dec 2019 23:05:01 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id z3so43890853wru.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 02 Dec 2019 04:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=soNW5fohseRrYu9CQUXRU3A2LW40lxkkIsWjpHtjy+4=;
 b=SUG7XFQxmmslnG3yAcE+XfPV6jsM+pD0FOn/54XPlpukSkJwexaujXTj7VWCN9CS51
 K1BGEZpvuVusIAPNwGWYifr6QBV3Ofv4pimEXUe+U5dyoDivC/moJFyo7GSqhy6FLBzE
 WWeFROjbPyNLXD3Ms5kdMU3IRJEI7ZHRWvg6XrjX7ok5CeC3Ac+2cLeXhB6D9JI3Gqwy
 27A+Hp/ugNpWU9QCKhl8xOP3Fq7lXOWOI4LlRYonFmGczAd9+0uJkz7DoDYWZddCb0O4
 LP84Kbe0/+QVfD1OcPz8Aj/skgXs+GqAe4hzEhQR44AkCyfP06M0x65zCPiL2tsJnVzV
 ilGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=soNW5fohseRrYu9CQUXRU3A2LW40lxkkIsWjpHtjy+4=;
 b=KXh55kSpEu07xPQhUphfUAEoPfAkPSxFbFnZya/qCgw4wSZPEeCoOYvYShRZdpY6YL
 fT5SPhl6yuS+EMTOW1o6DdQDsqUS2tUbQirlXiRs6ab3SOC1Wxo3ksC+fSsa55kHYsOL
 RUGbv4At19KweqvLGgBEdNq8+M9oCyt/tazJy1i7AuUuwdyt4VAuuovBvieI0v82eGcR
 5TzqQ6FI9nawPY3k1NjsDrmBiPgQEaXIDuib/viz/2Y4BS5viK9OOPI53J/1CgErxg+h
 J9AyNyItN8L1zSAn3gNqyJHzyVmiljJONpgr2l8jfHOtzk8qo1WtvXbnbv4Y+Qi3Ep1E
 5JzA==
X-Gm-Message-State: APjAAAWYBJV7M/J4F9a756H9mRnHV7rBkTY+A541WN09y4fEgqL1l3dA
 Cvc9rk4QOs1H/3MPgZ91ZWX6Lg==
X-Google-Smtp-Source: APXvYqwOBVgqYt1ED9Zw7laHel2W8Pvb3keFWerq1L9G4LSaenpLO4wmf6lPLnHFD28jBsEIYgohAA==
X-Received: by 2002:adf:db86:: with SMTP id u6mr72454037wri.318.1575288293871; 
 Mon, 02 Dec 2019 04:04:53 -0800 (PST)
Received: from dell ([2.27.35.155])
 by smtp.gmail.com with ESMTPSA id 60sm40793963wrn.86.2019.12.02.04.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 04:04:53 -0800 (PST)
Date: Mon, 2 Dec 2019 12:04:42 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 0/6] DA9062 PMIC features
Message-ID: <20191202120442.GC14416@dell>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <CACRpkdaSmwORgetv7aZjtgk+2OchcvQR4SBjdWQ4KsRMHuUvSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaSmwORgetv7aZjtgk+2OchcvQR4SBjdWQ4KsRMHuUvSg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 02 Dec 2019, Linus Walleij wrote:

> On Fri, Nov 29, 2019 at 6:25 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > this series address all comments made on [1]. Patch "gpio: add support
> > to get local gpio number" is splitted into:
> >  - "gpio: treewide rename gpio_chip_hwgpio to gpiod_to_offset"
> >  - "gpio: make gpiod_to_offset() available for other users"
> > Please check the discussion [1] for more information. You need to apply
> > [2] to test the new features.
> 
> I am very happy with the shape of patches (1) and (2).
> 
> I can apply these on an immutable branch and merge into the
> GPIO tree at v5.5-rc1 and offer to other subsystem maintainers
> to pull in so they can merge the rest of the patch series on
> top.
> 
> Alternatively I can merge all the patches into the GPIO tree.
> 
> I suppose this is not so much of a MFD business at this
> point so whatever the regulator maintainer prefers I suppose?

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
