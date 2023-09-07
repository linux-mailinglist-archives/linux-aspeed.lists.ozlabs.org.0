Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A0C797CF6
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Sep 2023 21:44:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LBkzCyN6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhV6w2ttzz3c4M
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Sep 2023 05:44:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LBkzCyN6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=rign=ex=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhV6l5RWXz3c1H
	for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Sep 2023 05:43:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B447361365;
	Thu,  7 Sep 2023 19:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5F7C433C7;
	Thu,  7 Sep 2023 19:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694115834;
	bh=XNJ6eaiy6oOw6b1KlAbPBrj8EtJk96f0FRUMDyQiiPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBkzCyN6TBJDyL3szlqcxnUz72Sedly9MEc8nJDUoDQRryvSruVBTgamW/W2No+3a
	 PP+prYSndor/ivzTvcAhKwJjvhGbQbfB+i/ROmxf5MjZZ6oZDEt9kg6NKR3k+zd89f
	 aPkYv6BJfJbgqJMlDCKSt/MSP2b83tJBOSL4vwEpHuVaVq8YO9o5oR991tFG+rf8Q5
	 YUD/zqAq8N9lkT0GyBdHvuAbeDH6IeBZA1GEhg5JRk9r+Xagqzv0bLjaMKnptFVG+T
	 qsx5821KeoE6/HPF+iR0oRIIuUj1FsMP2rUCKGh2xlT6BVfw5J8Qz/oHF7V5Q9Gm9e
	 E1HoIz9ceZQFQ==
Received: (nullmailer pid 2204967 invoked by uid 1000);
	Thu, 07 Sep 2023 19:43:51 -0000
Date: Thu, 7 Sep 2023 14:43:51 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Message-ID: <20230907194351.GA2033402-robh@kernel.org>
References: <20230830123202.3408318-1-billy_tsai@aspeedtech.com>
 <20230830123202.3408318-2-billy_tsai@aspeedtech.com>
 <20230905170010.GA3505375-robh@kernel.org>
 <SG2PR06MB336567E43537C7F4947E342F8BEEA@SG2PR06MB3365.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR06MB336567E43537C7F4947E342F8BEEA@SG2PR06MB3365.apcprd06.prod.outlook.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "naresh.solanki@9elements.com" <naresh.solanki@9elements.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Sep 07, 2023 at 07:17:55AM +0000, Billy Tsai wrote:
> On Wed, Aug 30, 2023 at 08:32:00PM +0800, Billy Tsai wrote:
> >> From: Naresh Solanki <naresh.solanki@9elements.com>
> >> 
> >> Add common fan properties bindings to a schema.
> >> 
> >> Bindings for fan controllers can reference the common schema for the
> >> fan


> >> +properties:
> >> +  max-rpm:
> >> +    description:
> >> +      Max RPM supported by fan.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> > Physics will limit this to something much less than 2^32. Add some 
> > constraints. 10000?
> 
> 
> >> +
> >> +  min-rpm:
> >> +    description:
> >> +      Min RPM supported by fan.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> > ditto
> 
> >> +
> >> +  pulses-per-revolution:
> >> +    description:
> >> +      The number of pulse from fan sensor per revolution.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> >Needs constraints. I assume this is never more than 4 (or 2 even)?
> 
> Do you think we should add the contraint in the common binding?
> In my option, the limit of the max/min rpm should be declared by
> the binding if necessary, because the usage of each fan monitor is
> based on the connection of the tach pin.

Yes, I think we should have default limits.

Unless we go as far as a schema for every specific fan model, then there 
is actually no way we can have specific limits unless the fan 
controllers have some limits.

The most I see in tree for pulses-per-revolution is 2. There's no value 
in more. So set the max to 4 and then if anyone needs more they can bump 
the value.

Or maybe there's some electrical/mechanical design reason fans are 1 or 
2 pulses and we'll never see anything else? This document[1] seems to 
indicate that is indeed the case. (First hit googling "fan tach signal 
pulses")

> 
> 
> >> +  div:
> 
> > Too generic of a name.
> 
> >> +    description:
> >> +      Fan clock divisor
> 
> > But what is a fan clock?
> 
> This is the divisor for the tachometer sampling clock, which determines the sensitivity of the tach pin.
> So, if the name of the property changes to 'tach-div,' is it acceptable to you?

That sounds like a property of the controller, not the fan, so it 
belongs in the controller binding. Is this really a common thing?

 
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +
> >> +  target-rpm:
> >> +    description:
> >> +      Target RPM the fan should be configured during driver probe.
> 
> > What driver? By the time the OS driver runs, a bunch of other boot 
> > software has already run on modern systems. So this value would likely 
> > be used much earlier. The point is that when exactly is outside the 
> > scope of DT. This is "what RPM do I use in case of no other information 
> > (e.g. temperature)".
> 
> So, the description should be changed to 'The default desired fan speed in RPM,'
> and we shouldn't mention the timing of the property's operation in the DT, is that correct?

Correct.

> 
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +
> >> +  mode:
> 
> > Too generic.
> 
> >> +    description:
> >> +      Select the operational mode of the fan.
> 
> > What are modes? Spin and don't spin?
> 
> The mode is used to indicate the driving mode of the fan (DC, PWM and so on).
> So, if the name of the property changes to 'fan-driving-mode,' is it acceptable to you?

I tend to think that should be implied from the parent node and/or other 
properties. PWM if "pwms" property is present. DC if the supply is 
variable. We could also use compatible strings in the fan nodes if 
there's a need.

That reminds me, both of these modes probably need a table of 
voltage/duty-cycle to RPMs. I imagine it's not always a linear response.  
Naresh also privately sent me (don't do that) an updated common binding 
which we discussed the need for this. I expect him to comment further 
with details.


> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +
> >> +  pwms:
> >> +    description:
> >> +      PWM provider.
> 
> > maxItems: 1
> 
> > I don't think there are fans with more than 1 PWM input?
> 
> Ok, I will add the constraint for the pwm input.
> 
> >> +
> >> +  tach-ch:
> >> +    description:
> >> +      The tach channel used for the fan.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> > The existing ASpeed version of this property allows more than 1 entry. I 
> > don't understand how a fan would have 2 tach signals, but if so, the 
> > generic property should allow for that.
> 
> Ok, I will modify it to the uint32-array

Perhaps uint8-array to align with existing versions of the property.

> 
> > Perhaps 'reg' should be defined in here with some text saying 'reg' 
> > corresponds to the fan controller specific id which may be the PWM+TACH 
> > channel, PWM channel (deprecated), or TACH channel. I think there are 
> > examples of all 3 of these cases.
> 
> I don't think it's necessary for the 'reg' because the case you mentioned is
> already covered by the property 'tach-ch' and the 'pwms'.

Yes, but when we have N child nodes of the same thing, we usually have 
"reg" and its value corresponds to how the parent identifies each child. 
We already have a mixture using PWM or tach channel. Yes, this can all 
just be in the fan controllers binding, but putting it here would just 
document the options.

Rob


[1] http://www.comairrotron.com/methods-monitoring-fan-performance
