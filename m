Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B7C86F8EE
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Mar 2024 04:37:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MG91fMa5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tp4Bd55Dfz3cNN
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Mar 2024 14:37:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MG91fMa5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tp4BR4WVGz2ysD
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Mar 2024 14:37:02 +1100 (AEDT)
Received: from [192.168.68.112] (unknown [118.211.81.9])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D378C20135;
	Mon,  4 Mar 2024 11:36:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1709523420;
	bh=Ub2TVSCczszte0SH6YnSG2kxRnFXdOaAJHV7P++nO/4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MG91fMa5eFHS5RGG6Z+Mz9vdgov4oJt8iz+az5ejbgvd6W6Fvohwi6rTaxktmDOEp
	 0pZaqZTcq7QzyTtVEPYSl9ssScIrHNT9qeUanuLX7KQ+dVtDT03DnRHFpD+4oElSUs
	 EhTKK+XeZoh+/6WB6ClLDHBhODiJAuH/2nFzdQwsdKFqRepkg0BvazWm9PEyBpKoBi
	 6wSoiYK7g/iic3lBK+hpxLcrQzUWJVHKm0Ioqgk1oGs0gKWP1N17ptFkjXmAl6fWG9
	 BRgXrlBErNl0bXjpmE7oOSz6/Ezg2YytteBdGuxhc3hSgQTuU5sr8abaFkmYrRVq/F
	 gGwodKlOgpwmA==
Message-ID: <33f423783b71a4e4dd6e8c37a8909a69c25fb24c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to
 DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 04 Mar 2024 14:06:55 +1030
In-Reply-To: <CAMRc=Mfa1uUhkPNpLdcMsGC4=G+_MGzaxXRL7UVdfKJD_zF0+w@mail.gmail.com>
References: <20240228003043.1167394-1-andrew@codeconstruct.com.au>
	 <c2060450-4b76-4740-afe4-d14717245f01@linaro.org>
	 <16ddd99007176da3f84462de217cb76c8fa4e1bd.camel@codeconstruct.com.au>
	 <CAMRc=MeEyo7y-G1saydxtTRedNtHPaEeLANuzXt6KsiDU2jOWw@mail.gmail.com>
	 <e55aa1321ccac8e6391ab65a5a439b49d265bfce.camel@codeconstruct.com.au>
	 <CAMRc=Mfa1uUhkPNpLdcMsGC4=G+_MGzaxXRL7UVdfKJD_zF0+w@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-03-01 at 09:18 +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 1, 2024 at 12:23=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Thu, 2024-02-29 at 09:52 +0100, Bartosz Golaszewski wrote:
> > > On Thu, Feb 29, 2024 at 4:21=E2=80=AFAM Andrew Jeffery
> > > <andrew@codeconstruct.com.au> wrote:
> > > >=20
> > > > On Wed, 2024-02-28 at 08:47 +0100, Krzysztof Kozlowski wrote:
> > > > >=20
> > > > > You still have way too many examples. One is enough, two is still=
 okay.
> > > > > We really do not want more of examples with minor differences.
> > > >=20
> > > > Noted, I'll keep them to a minimum in the future.
> > > >=20
> > >=20
> > > As in: I'll still send a v7? I can trim the examples when applying,
> > > just tell me which ones to drop.
> >=20
> > Ah, thanks. I wasn't planning to send a v7 given the R-b tag from
> > Krzysztof for v6. I intended for "in the future" to mean for patches
> > converting other bindings to DT schema. But if you're keen to trim some
> > examples out I'd drop the aspeed,ast2400-gpio and aspeed,ast2500-gpio
> > nodes, keeping just the aspeed,ast2600-gpio example.
> >=20
> > Andrew
>=20
> It's ok, I applied it as is.

Thanks!

Andrew
