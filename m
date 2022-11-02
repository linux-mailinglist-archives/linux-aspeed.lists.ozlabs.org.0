Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D450E616BDD
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 19:19:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2ZtF5G8Qz3cHw
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 05:19:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bvxGXj7U;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bvxGXj7U;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2Zt56JXZz309f
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Nov 2022 05:19:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 27547B82427
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Nov 2022 18:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E54C433D7
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Nov 2022 18:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667413175;
	bh=ByC8WrBr65R1FHnYm1bG2iBmanhGcnHFrTlrNhwgv9I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bvxGXj7UcpjIlwlOO3Si5m4Boq+XXLd0gL/TvGFf/LtJd7Ph0QNwzv13RXPo4nFKr
	 ux+mAfYvQZ/T7HQuv3qWrU6rgoxXhUGtiadfAHIr0Y0BDKg+V4qPJOa6zg6Y0nURWT
	 mc5Jz/XC/APTUiCVdkfMmCpLeRNuhDQfnHmM9TLEj/6AmuLeyd3OUIfnVHqaMWDTPV
	 2EWLYW0AsKCy/tlIw/R7B1zrLIpup7xuibv+D33vs48IO+QFfuSvcFSPSPR1IS0fi+
	 GwQEK83D1BZu+duczaPKs5sLPZQXDq42lajbd7jhwg46rDbfVReAVp54hweOjkdMbS
	 z4C0cnzwlZRHQ==
Received: by mail-lf1-f41.google.com with SMTP id d25so29142361lfb.7
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Nov 2022 11:19:35 -0700 (PDT)
X-Gm-Message-State: ACrzQf3DWdco0W/OIpTZmyBJ59TM/5/Pk/J7ZW4r/68bZLxPJSgWAYl8
	KpZdi/ti9wKIbJlj1LPAzt6Wy6WZU59gn3gv3Q==
X-Google-Smtp-Source: AMsMyM6XQ3NC5gBobYHWQcBcHOobrD1WFx27yP9ubnkL/AtrLYNZY8dUZB57wcoTBz1HIHNzPxaicM/OyX8pqvkFHwA=
X-Received: by 2002:a19:5048:0:b0:4b1:3856:e422 with SMTP id
 z8-20020a195048000000b004b13856e422mr2174132lfj.368.1667413173675; Wed, 02
 Nov 2022 11:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221101095156.30591-1-billy_tsai@aspeedtech.com>
 <20221101095156.30591-2-billy_tsai@aspeedtech.com> <20221101184033.GA1879756-robh@kernel.org>
 <C4090559-71D3-4DC4-A994-474D375DC4EF@aspeedtech.com>
In-Reply-To: <C4090559-71D3-4DC4-A994-474D375DC4EF@aspeedtech.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 2 Nov 2022 13:19:24 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+eiFO9JyJW=2SB-HLHJLrXggO+7kwG8G-6Zt=K2QnFUA@mail.gmail.com>
Message-ID: <CAL_Jsq+eiFO9JyJW=2SB-HLHJLrXggO+7kwG8G-6Zt=K2QnFUA@mail.gmail.com>
Subject: Re: [v2 1/3] dt-bindings: Add bindings for aspeed pwm-tach.
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "garnermic@meta.com" <garnermic@meta.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 1, 2022 at 10:21 PM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> Hi Rob,
>
> On 2022/11/2, 2:40 AM, "Rob Herring" <robh@kernel.org> wrote:
>
>   >  On Tue, Nov 01, 2022 at 05:51:54PM +0800, Billy Tsai wrote:
>   >  > This patch adds device binding for aspeed pwm-tach device which is a
>   >  > multi-function device include pwm and tach function and pwm/tach device
>   >  > bindings which should be the child-node of pwm-tach device.
>   >  >
>   >  > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>   >  > ---
>   >  >  .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 48 ++++++++++++
>   >  >  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 76 +++++++++++++++++++
>   >  >  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 64 ++++++++++++++++
>   >  >  3 files changed, 188 insertions(+)
>   >  >  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
>   >  >  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>   >  >  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
>
>   >  I'm pretty sure I've said this before, but I'm not taking more fan
>   >  controller bindings without comming up with a common binding. Please see
>   >  this series[1] and help ensure it meets your needs.
>
>   >  Rob
>
>   >  [1] 20221013094838.1529153-2-Naresh.Solanki@9elements.com <https://lore.kernel.org/all/<a href=>/">https://lore.kernel.org/all/20221013094838.1529153-2-Naresh.Solanki@9elements.com/
>
> The link you provide doesn't meet my needs. This is fan binding.

A PWM and Tach controller is for fans, no?

As I said, contribute to it so that it does meet your needs.

> As I told before
> "This patch doesn't use to binding the fan control h/w. It is used to binding the two independent h/w blocks.
> One is used to provide pwm output and another is used to monitor the speed of the input."
> My patch is used to point out that the pwm and the tach is the different function and don't need to
> bind together. You can not only combine them as the fan usage but also treat them as the individual module for
> use. For example: the pwm can use to be the beeper (pwm-beeper.c), the tach can be used to monitor any device's speed.

That all sounds like requirements that you have which you should
ensure the fan binding can support.

I've already said to use the PWM binding in the fan binding exactly
for the purpose of hooking up the PWMs to other things. Whether the
tach controller is useful for something other than fans, I don't know.
Seems less likely. The max6639 also has a tach controller. So if other
uses are possible for you, then it could be possible for any other h/w
like the max6639.

Rob
