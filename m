Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F48B2DD1
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 02:03:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dH+jj5xa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQXxv2QxZz3dW8
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 10:03:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dH+jj5xa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQXxk3HMrz2xYY
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Apr 2024 10:03:38 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C16C220075;
	Fri, 26 Apr 2024 08:03:34 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714089815;
	bh=M9RCLwNtHz1ibg6MewvdUAQL48YIP3XWMZ2BRIaTbV8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dH+jj5xaNoubg/mo+sV5omBdhuvH+sKNYLc0AcId5Acg4A93WJ47WxSgU16oQi2AW
	 LF5T734oRyamaGvslkv7FavcoyB8cA1tFPKp3Yed0XE2oLtMRWpiGWXBKfMNKKQRUz
	 uD44/E8vX4h6y+GIe9+WaB4BJ6dBmtiuFnDTvpMeIbs1RsCo0y4HG9TpQlkhyZAyWS
	 4IqYgmOI7wZN+3u3SaNZaK1KXVzBgcBd3dOYUSl9rwyf8ro/O5ebmuQW5AJkWQKocN
	 qUl5kOO7JbFqtLXQw2MjVr54S1Ao1KR4ROTEzxsH+m8yDkGfhSckE5q7re/HCIhQyD
	 SFHjBvFHaXRKA==
Message-ID: <6357235a4a42e889a2b6d7d7ad5511ded4cc29d8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add IBM P11 BMC boards
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Date: Fri, 26 Apr 2024 09:33:32 +0930
In-Reply-To: <7dd9ba1b-6477-4c09-a571-57002cbfa8b7@linux.ibm.com>
References: <20240415154931.10775-1-eajames@linux.ibm.com>
	 <48ad6bcccae315e68bc0aa10669eed645c495139.camel@codeconstruct.com.au>
	 <7dd9ba1b-6477-4c09-a571-57002cbfa8b7@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: lakshmiy@us.ibm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2024-04-25 at 16:41 -0500, Eddie James wrote:
> On 4/15/24 19:02, Andrew Jeffery wrote:
> > On Mon, 2024-04-15 at 10:49 -0500, Eddie James wrote:
> > > Add the Blueridge and Fuji BMC systems.
> > >=20
> > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > ---
> > > Changes since v1:
> > >   - Change "ody" to "odyssey"
> > >=20
> > >   arch/arm/boot/dts/aspeed/Makefile             |    2 +
> > >   .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1752 +++++++
> > >   .../boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 4016 ++++++++++++++=
+++
> > >   .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1704 +++++++
> > >   4 files changed, 7474 insertions(+)
> > A few points:
> >=20
> > - Altogether this patch is pretty large. Can we do one for each of the
> > FSI topology and the platforms?
> >=20
> > - The only list to which you've sent the patch is linux-aspeed, which
> > doesn't appear to be archived on lore. Can you please add at least one
> > that is? There are a few that should probably be included regardless.
> >=20
> > - I don't plan to merge the patch until it has had review from ideally
> > more than one other IBMer
> >=20
> > On the review front:
> >=20
> > It looks like you still need to update
> > Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml with the new
> > platform compatible strings.
> >=20
> > Also, can you please run
> >=20
> > ```
> > make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-{blueridge,fuji}.dtb
> > ```
> >=20
> > and address the warnings? This is best done by first applying the patch
> > on top of my tree below. It goes some way to eliminating many of the
> > warnings currently produced for the Aspeed BMC SoCs:
> >=20
> > https://github.com/amboar/linux/tree/dt-warnings/all
>=20
>=20
> Thanks, I've sent v3. One patch has turned into 14 to address the=20
> warnings...
>=20

Super work, thanks for that.

>  There were still many but they're almost all from=20
> aspeed-g6.dtsi.
>=20

This is based on top of my WIP series fixing a bunch of warnings, or on
top of an upstream tag for submission? Admittedly I didn't fix them all
but I did clean up a decent chunk of what was there.

>  The only remaining ones from Blueridge/Fuji that I saw=20
> were for undocumented compatibles for max31785 and pca955x.
>=20

Fantastic.

> Those=20
> bindings exist but are not in yaml format so the tool doesn't pick them=
=20
> up. I'm sure those can be addressed at another time...

Yep, sounds good.

Thanks for your efforts.

Andrew

