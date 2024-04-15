Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 559AD8A4663
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 02:50:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lDwmQvsS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHpVl2WmLz3dVX
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 10:50:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lDwmQvsS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHpVg2PW5z3cDw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Apr 2024 10:50:19 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 527DC20178;
	Mon, 15 Apr 2024 08:50:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1713142218;
	bh=8Yn8Ev22sgChTJKYaeg8JhOdlPOhLg3KXa+zzQErxAA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lDwmQvsSFihUxM6dIz0/vxd9h/QEzBF9Nog5B1v0O6tq4qINSWIOjmRiyntU1xkDE
	 tCW8EiZGaVZNJ0rYKlzF9+E0kes0Vr8x2jL68yCtxrI97RYejHJOlhjJYV44xLVZuM
	 cUWwAKgFqziV+vjHeRFG8iNVuQvuCiCXsmjftX+jVMJMCzPjUUKRI3SEV/xVJMI+Y8
	 KhDdh8vNfqclp0OCQUKFuC2IMmgBydaT/3mB+RiANFJCLrlJnqf1KvlrinPWm8txOC
	 obCja/04z9dnDO5/Mas2rhn1BzgVSpZGm3EmNKxPnHIp9+uN0cTIEGdGUl4JNvx1sG
	 TCNEQkKFrhp6A==
Message-ID: <95510c550a31305ae192640ce54ed86544e79f12.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: fsi: Document the IBM SBEFIFO engine
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Date: Mon, 15 Apr 2024 10:20:16 +0930
In-Reply-To: <20240412144358.204129-2-eajames@linux.ibm.com>
References: <20240412144358.204129-1-eajames@linux.ibm.com>
	 <20240412144358.204129-2-eajames@linux.ibm.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, alistair@popple.id.au, jk@ozlabs.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-04-12 at 09:43 -0500, Eddie James wrote:
> The SBEFIFO engine provides an interface to the POWER processor
> Self Boto Engine (SBE).
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../devicetree/bindings/fsi/ibm,sbefifo.yaml  | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,sbefifo.yam=
l
>=20
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,sbefifo.yaml b/Doc=
umentation/devicetree/bindings/fsi/ibm,sbefifo.yaml
> new file mode 100644
> index 000000000000..d70012e42d79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/ibm,sbefifo.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/fsi/ibm,sbefifo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IBM FSI-attached SBEFIFO engine
> +
> +maintainers:
> +  - Eddie James <eajames@linux.ibm.com>
> +
> +description: |
> +  This binding describes an FSI CFAM engine called the SBEFIFO. Therefor=
e this
> +  node will always be a child of an FSI CFAM node; see fsi.txt for detai=
ls on
> +  FSI slave and CFAM nodes. This SBEFIFO engine provides an interface to=
 the
> +  POWER processor Self Boot Engine (SBE).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ibm,p9-sbefifo
> +      - ibm,ody-sbefifo

Bit of a nitpick, but: Is there any argument against using
`ibm,odyssey-sbefifo`? Feels less cryptic.

Andrew
