Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A79913FA4
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 03:06:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RXWdII/z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6qXm2Trhz3cTZ
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 11:06:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RXWdII/z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6qWj2zqRz30Vr;
	Mon, 24 Jun 2024 11:05:21 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E023A2009F;
	Mon, 24 Jun 2024 09:05:19 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719191121;
	bh=9E8DTzg+OwcBRU6TbLdG+sxmbaLnRszqiEzQCtNxO7o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RXWdII/zWOenRm89XgtvdUf1jC335eY6OUP7rn0qevUrlEJI18g94jfeW+Cmqpubg
	 mg7Hd5L4P49ld/EqsdLGeR1WJ5wkvC09TxlmLbIMeaOZK6uAlDp7PerOKY5Y0zxQnF
	 dmR29ZXoygVlSU4eYywjpIeeqDXVw9luvszpluhuK0fFYwlUf+w5wWrbu553Su6A6j
	 d94MDaPWExwcom0MZ+A1YDTHI7AZhAYsRQVBpXI3N7qMyJtqpw0LhougqElg/TMreT
	 CmW+yQ8oREbMYokELVu4Pr82/Yp6iHbQhPaSbQT7Cy3U0OF44tCLPxQsrtUW5T9nRt
	 UkXL+CTdMDvTQ==
Message-ID: <25f3b4cf773f2757ec134b0e82f59a483eed28c5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl:
 add NCSI group
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 24 Jun 2024 10:35:19 +0930
In-Reply-To: <CAGfYmwWp2dayGvySdYvU+nmtxZ-x3PPW_j69ZoBD4mxzPMQAzg@mail.gmail.com>
References: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
	 <20240620084337.3525690-2-potin.lai.pt@gmail.com>
	 <cb55efedaef63e4580c11415aa2e29606edcaf9f.camel@codeconstruct.com.au>
	 <CAGfYmwWp2dayGvySdYvU+nmtxZ-x3PPW_j69ZoBD4mxzPMQAzg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Patrick Williams <patrick@stwcx.xyz>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Potin Lai <potin.lai@quantatw.com>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Cosmo Chou <cosmo.chou@quantatw.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-06-21 at 16:53 +0800, Potin Lai wrote:
> On Fri, Jun 21, 2024 at 8:46=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
>=20
> > Can we also do this for RMII{1,2}RCLKO (and in the driver patch as
> > well)?
> >=20
> The power of RMII{1,2} is 1.8v, which does not meet NCSI requirements.

Ah, thanks for catching that.

Andrew
