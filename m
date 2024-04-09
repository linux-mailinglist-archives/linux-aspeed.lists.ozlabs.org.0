Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F21DB89D8FC
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 14:12:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=my38CGIS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDPwJ3fX8z3dXM
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 22:12:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=my38CGIS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 6295 seconds by postgrey-1.37 at boromir; Tue, 09 Apr 2024 22:12:09 AEST
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDPw941T3z2xmC
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 22:12:07 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91EBBE0004;
	Tue,  9 Apr 2024 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712664719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfWm8vYO3mDEuNQxKWMBm2paN+K8NdDcQizKVDcIoC4=;
	b=my38CGISljwiJ5IwyCJK8F66IO6v+ZQoKG8dNf48uMYkp6aWgPzFutmbt0GJP2xSYK/Rh3
	JoJ2t/QZruB2XuoNFZYqXUDc6qtPUp4rIvI1DzmCi2bZikWmYcXYKkgwd3f2UN3nO7xxIr
	Ma/RleoaEAPuSsj5A4rI8Y+gWy3Sns0quh7Ybo8dgjGo9Cxt9DRPHs7Exum5rnesjLwAYR
	kmnZD0ZMLoiE5GM95Atw5sZLGKYDX6xVVWai8iv/ggPqDuohI90RnD7DwDxJTJju27cmHm
	m88JatRVGUgGG27aqS4R/sNXVBrzXc6j2xkGm1yse3fhIeDkcR9RLbvy/TcF5Q==
Date: Tue, 9 Apr 2024 14:11:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: rtc: lpc32xx-rtc: move to trivial-rtc
Message-ID: <20240409121153e2941468@mail.local>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
 <20240408-rtc_dtschema-v1-3-c447542fc362@gmail.com>
 <dd5e9837-0dcf-4b0e-8d11-f8bed868cdf2@linaro.org>
 <6dc808bf-682f-4e91-aac7-7ce6f05a0ab4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dc808bf-682f-4e91-aac7-7ce6f05a0ab4@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 09/04/2024 10:52:54+0200, Javier Carrasco wrote:
> On 4/9/24 09:34, Krzysztof Kozlowski wrote:
> > On 08/04/2024 17:53, Javier Carrasco wrote:
> >> This RTC requires a compatible, a reg and a single interrupt,
> >> which makes it suitable for a direct conversion into trivial-rtc.
> >>
> >> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> >> ---
> >>  Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt  | 15 ---------------
> >>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
> >>  2 files changed, 2 insertions(+), 15 deletions(-)
> > 
> > This one no... and if you tested DTS you would see errors, although you
> > need to test specific lpc config, not multi_v7.
> > 
> > It does not look like you tested the DTS against bindings. Please run
> > `make dtbs_check W=1` (see
> > Documentation/devicetree/bindings/writing-schema.rst or
> > https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> > for instructions).
> > 
> > Anyway, you *must* check all DTS before moving anything to trivial.
> > 
> > Does it mean all other bindings were not checked against DTS at all?
> > 
> > Best regards,
> > Krzysztof
> > 
> Hi,
> 
> I did check the conversion against nxp/lpc/lpc3250-phy3250.dts, which
> throws a message about the 'clocks' property.
> 
> That property is not documented in the original binding, and even though
> it could be missing, I could not find any function to get a clock (i.e.
> any form of clk_get()) in rtc-lpc32xx.c, which is the only file where
> the compatible can be found.
> 
> Is therefore the property not useless in the dts? My apologies if I am
> missing something here.

The bindings doesn't document the driver but the hardware. In this case,
the only input clock seems to be a 32kHz crystal.

> 
> Thanks and best regards,
> Javier Carrasco

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
