Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9DD11D08E
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 16:09:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ycdq3GzYzDqxF
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Dec 2019 02:09:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::942;
 helo=mail-ua1-x942.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="m4/Wr2qv"; 
 dkim-atps=neutral
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ycdb3cZNzDqnT
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Dec 2019 02:09:01 +1100 (AEDT)
Received: by mail-ua1-x942.google.com with SMTP id d6so1004956uam.11
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BBZPqQLjRrXMYmR1TRaqMyhH4qY4XtbQYO8hjLWbaCQ=;
 b=m4/Wr2qvLIWwO/nnv/MWFlzrVTYqwIuP//VHOprM0TS4aqnouLBYYbuKXDfZOW4zy6
 WwGNt6wKboMPLkZ2E8/NZCbgzjnehCPCJew6MkeU98jvV4zfh3C9C65H7kzchE6IfEc3
 cPsLn0wlOvRbdjWraOtHB9YHqPNxincix8AEtn1vTYqcZFNx++w0YhKkj22b+wEn8D58
 KihdxGOOV7uAKzwjHIWmulnscOi9cX+DuB+DkH8CWtEvucWc13p3AmI36VLn7BCMFG22
 2TmNAFLJ76Xm9ie4xkbBYzaNembFUKkM0K5MrWfnOhPIfPCMMWLF/Aei/G4b6ruqQ5om
 6DNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBZPqQLjRrXMYmR1TRaqMyhH4qY4XtbQYO8hjLWbaCQ=;
 b=D5HRL25YTB86jBtlGMwzAk03E5fiw4tUoN8s8rnqrOIvi4hM1m2uyReNptlP8hLjFF
 Vu6FgPzKfCxkT3BKp7qDQyfSGoZT0FV3gcTbvQrNwZ8pwC9xmDXJ0nbejLmYqglc8elZ
 la4zQycmdNXQuJSd5iBTfjlL9EGDXENTlD6b+V1ujzfK2pTjOlptuRy479xSDIaz4P/w
 x994PXI5bcd4xQTr8NG+zSYHdqwXfVQ8Ht9PjhzW0VsJRLaB9TRROLz/+e5b0TKZhfk/
 cPa6vDyJErHY8VsBB0PVvHQ+dKsy81gQpC3VpOqwzNYzOSgD0jBD1WzujH9a13PlJqsW
 5pTg==
X-Gm-Message-State: APjAAAVVl/oLm4GiHVDoICdIIfNDl7BtNIoY4S4Jbm3S6uMav8HBJ0z2
 LWyxbvC+ACvp4x70zpw2MJrDMz9VoKM5zefJBt0KKg==
X-Google-Smtp-Source: APXvYqylzTcuVtIdKTe2ptVzi2MZfkuPeOlp+Ab7T3CJfNA/27r7rEWO5mUtRTY83LtjQy3Do512L/IYNuh6OowCLas=
X-Received: by 2002:ab0:2716:: with SMTP id s22mr8672177uao.20.1576163336218; 
 Thu, 12 Dec 2019 07:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
In-Reply-To: <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Dec 2019 16:08:44 +0100
Message-ID: <CACRpkda4PFA=99u33xsXzQND1FaP=8GXGRQULngcd5a=zFepXg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
To: Marco Felsch <m.felsch@pengutronix.de>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 Mark Brown <broonie@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 11, 2019 at 6:09 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> I discussed it with a colleague again and he mentioned that pinctrl
> should be named pinctrl instead it should be named padctrl.

Quoting Documentation/driver-api/pinctl.rst:

(...)
Definition of PIN:

- PINS are equal to pads, fingers, balls or whatever packaging input or
  output line you want to control and these are denoted by unsigned integers
  in the range 0..maxpin.
(...)

> We don't
> reconfigure the pad to a other function it is still a device general
> purpose input pad. The hw-signal flow goes always trough the gpio block
> so one argument more for my solution. Also we don't configure the "pad"
> to be a vsel/ena-pin. The hw-pad can only be a gpio or has an alternate
> function (WDKICK for GPIO0, Seq. SYS_EN for GPIO2, Seq. PWR_EN for GPIO4).
> Instead we tell the regulator to use _this_ GPIO e.g. for voltage
> selection so we go the other way around. My last argument why pinctrl
> isn't the correct place is that the GPIO1 can be used for
> regulator-0:vsel-in and for regulator-1:enable-in. So this pad would
> have different states which is invalid IMHO.

Yeah it is just one of these cases where the silicon designer pulled
a line of polysilicone over to the regulator enable signal and put a
switch on it and say "so you can also enable the regulator
with a signal from here", it can be used in parallel with anything
else, which is especially messy.

Special cases require special handling, since the electronic design
of this thing is a bit Rube Goldberg.

Yours,
Linus Walleij
