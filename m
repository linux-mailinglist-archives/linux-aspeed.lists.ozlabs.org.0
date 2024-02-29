Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C0786D7A9
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Mar 2024 00:23:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T35ZCjxn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tm6jf5Lr6z3vXd
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Mar 2024 10:23:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T35ZCjxn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tm6jV31FLz3cWR
	for <linux-aspeed@lists.ozlabs.org>; Fri,  1 Mar 2024 10:23:42 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-70-176.adl-apt-pir-bras31.tpg.internode.on.net [14.2.70.176])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1092A2014F;
	Fri,  1 Mar 2024 07:23:36 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1709249019;
	bh=iwhvBuR3uowqRZpqmpqi0jgdnW+GpbB/EsS1T+Pi24Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T35ZCjxnY32uGh1veM/9q6f1NytauK7tck34JYdig1hWxH48PHb4OylbgljFV7Yvs
	 lMwpgNgI4Adtol5s228u5RgVH7fEvlW3pjC0EK2eb60yPen92xuja2B5vU5IebcL5B
	 46yZkX+PriKqmQP57m/8GL90/NGbUfHxBLQUOjJqRSn5Ib+kxFGEknw6UBb8zDbq1r
	 eeGC8jDGcZ5U2JxbesjLGLOKSsRRbqr391cKM/bVdWQuYYr0RdkJUTFmhWUzwLHrgm
	 bm/iSfjkySDatt8zWhbl/05ELmOZPHoJTYyYixQXlMxOKxz9J8tHxm3fB6gCcavcbW
	 PrNZeGOggyRag==
Message-ID: <e55aa1321ccac8e6391ab65a5a439b49d265bfce.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to
 DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 01 Mar 2024 09:53:36 +1030
In-Reply-To: <CAMRc=MeEyo7y-G1saydxtTRedNtHPaEeLANuzXt6KsiDU2jOWw@mail.gmail.com>
References: <20240228003043.1167394-1-andrew@codeconstruct.com.au>
	 <c2060450-4b76-4740-afe4-d14717245f01@linaro.org>
	 <16ddd99007176da3f84462de217cb76c8fa4e1bd.camel@codeconstruct.com.au>
	 <CAMRc=MeEyo7y-G1saydxtTRedNtHPaEeLANuzXt6KsiDU2jOWw@mail.gmail.com>
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

On Thu, 2024-02-29 at 09:52 +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 29, 2024 at 4:21=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Wed, 2024-02-28 at 08:47 +0100, Krzysztof Kozlowski wrote:
> > >=20
> > > You still have way too many examples. One is enough, two is still oka=
y.
> > > We really do not want more of examples with minor differences.
> >=20
> > Noted, I'll keep them to a minimum in the future.
> >=20
>=20
> As in: I'll still send a v7? I can trim the examples when applying,
> just tell me which ones to drop.

Ah, thanks. I wasn't planning to send a v7 given the R-b tag from
Krzysztof for v6. I intended for "in the future" to mean for patches
converting other bindings to DT schema. But if you're keen to trim some
examples out I'd drop the aspeed,ast2400-gpio and aspeed,ast2500-gpio
nodes, keeping just the aspeed,ast2600-gpio example.

Andrew
