Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D55EB6182B7
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 16:27:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N370q14T2z3cK2
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Nov 2022 02:27:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tZ5WpOZ7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tZ5WpOZ7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N370h5jrXz3c1n
	for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Nov 2022 02:27:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C670E61F3C;
	Thu,  3 Nov 2022 15:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E4BC433D6;
	Thu,  3 Nov 2022 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667489232;
	bh=9B6TUpcxiiK6nYvO+tZ9kBnE+5WGkzDACOo23ch8WCA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tZ5WpOZ7axSdC5g+29cT7yfgHFK7yRD4IMa9dxMheFgkrT+RotkRJIfGpMbS8c2oB
	 GLepVRcm47TWGrS8XxZEjPXQd/dhZ6MHaRdTgQE31CF/NUJyg5qIHfYpybQjsxv1Sz
	 H2ohLNem3YsF5qko+37yaXfV8sIS4HQIKF6qKwpuokjcSPbDtfVxb/xymZ2rriGS6M
	 ddt5ca0zSqtZofSKXTQ+7ZluG2cY4BnUqNrxvVVUcEo4//EFGYCwRch+2ymfS8cz/T
	 BrzbhTK7MwpypzEP6XkeN5A91xn5vzWYaYa2FDwBHNazQQjScK29irhQTMFeGE2Bhn
	 0tGxzRJKJruRQ==
Message-ID: <576c42c4-1256-304d-3513-7bf02cddb220@kernel.org>
Date: Thu, 3 Nov 2022 11:27:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/3] dt-bindings: Add bindings for aspeed pwm-tach.
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "garnermic@meta.com" <garnermic@meta.com>
References: <20221031103809.20225-1-billy_tsai@aspeedtech.com>
 <20221031103809.20225-2-billy_tsai@aspeedtech.com>
 <ee6c5a96-81c4-5729-f623-4b23bc3b8e0a@kernel.org>
 <2508B515-E153-42C2-B013-2A64A110BCF2@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <2508B515-E153-42C2-B013-2A64A110BCF2@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 03/11/2022 06:36, Billy Tsai wrote:
> 
> On 2022/11/3, 5:20 AM, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
> 
>     On 31/10/2022 06:38, Billy Tsai wrote:
>     > > +patternProperties:
>     > > +  "^pwm(@[0-9a-f]+)?$":
>     > > +    $ref: ../pwm/aspeed,ast2600-pwm.yaml
> 
>     > Full path, so: /schemas/pwm/aspeed,ast2600-pwm.yaml
> 
>     > Why unit addresses are optional?
> 
>     > > +
>     > > +  "^tach(@[0-9a-f]+)?$":
>     > > +    $ref: ../hwmon/aspeed,ast2600-tach.yaml
> 
>     > Ditto
> 
>     > Why unit addresses are optional?
> 
> The pwm_tach is not the bus. I will use
> pwm:
>     type: object
>     $ref: "/schemas/pwm/aspeed,ast2600-pwm.yaml"
> 
> tach:
>     type: object
>     $ref: "/schemas/hwmon/aspeed,ast2600-tach.yaml"
> to replace it.
> 
>     > > +
>     > > +additionalProperties: false
>     > > +
>     > > +examples:
>     > > +  - |
>     > > +    #include <dt-bindings/clock/ast2600-clock.h>
>     > > +    pwm_tach: pwm_tach@1e610000 {
> 
>     > Node names should be generic.
>     > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> This is the mfd with pwm and tach, so they are combined as the node name.
> 
>     > No underscores in node names.
> 
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#table-1
> I see that the underscore is the valid characters for node names.
> Did I miss any information?

W=2 warnings.

Best regards,
Krzysztof

