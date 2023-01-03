Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE8665C8A6
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Jan 2023 22:11:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmllB04FMz3bTM
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Jan 2023 08:11:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=l/Ymnnip;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OqWdDdub;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=l/Ymnnip;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OqWdDdub;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nmll11Mlnz2y8Q
	for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Jan 2023 08:10:53 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id F1F675C009F;
	Tue,  3 Jan 2023 16:02:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 03 Jan 2023 16:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1672779776; x=1672866176; bh=pYyngyFrs7
	Swu2i/2VlLaaGYAQBCdORNkfqDSR3xksM=; b=l/YmnnipeDZZ5+YFg8xP+ROkZJ
	XdH1uUol2A8EGoopgsT7zwcBYik06W9s+VwVq2YREmDVQyKtD9ndW2I6hBkGKhPI
	8X1Q6+G7Cl5VkLSn7zA5Qe27NVuWEycb4alBhZqPyXheAVP+5H93S4KfJkFLiZkI
	lo4nmIlUsslEGZ3yPCO6H7xUlxUbxdoYycAQwev0LN4YpTye7oKsun3uX83DTTA8
	RUkkPW0NN6hqKxaPeiE6lB5kxB1hcD3UH+gUYjGrT8+igIlNL4n6fKZAkJPyOGPb
	oH/qAe81tUbxJOb0fxTCpdZkUARiBWtAEFmN94ZuETEycRvc2BTPJbL5E5fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672779776; x=1672866176; bh=pYyngyFrs7Swu2i/2VlLaaGYAQBC
	dORNkfqDSR3xksM=; b=OqWdDdubCRRQivWCgD/irou7XUaCrVBTQd1rlVLf7orn
	QtBM1ts4nX59h6TDVQInr/znV8xCvFRbG+bflakrj6ljW5+YzX9/cSZIl4mv2SjW
	d/ZFFi0IViTEXBeRl1oKfVuyC9PiohN1id2LfukvRVKHsvNP7mu6bQ3zp5oXUc43
	UPa237dYO3TaW9szEeRQkOxzZnVrv9WXB21Dh+mO7+3xoB7wyHgx3EsYcWaOPMHX
	2pqZT2DbR24InzlDkFfTlaJHvTJH/pg5zZNocIuK5SY+o2WxV1nD3AAQdAYlAyXd
	IkV1qCMLorwIkrmV7ZLeI+Vkz+ULlssiCKP9JFO9KQ==
X-ME-Sender: <xms:AJi0Y7ali3MMr3ifZpRVdX9g5eQ9vS3ZF7GQpv8DJms1NOo-zA6WqQ>
    <xme:AJi0Y6YuFYkmVtQ6Rs9u4P6OjXoL8_n4HxOzh5Uy_pubS7ZELwyWrOJ5m7rMqy0lp
    ieEqqDdq7Yw8WKK1Kc>
X-ME-Received: <xmr:AJi0Y99YVlJcNszWitpGukskxBoSfwPM7tNgV8pjN43V_inzf8uUxERuw8frHUjcYvxYgkWgmCQG9CTq0VaYlzIFO7zw_0gaVwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedune
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:AJi0YxqdEzdiXugT3g7nBMtQbSKEwCAtc4cgNhxTQZ9q3FYakoJ2Cg>
    <xmx:AJi0Y2oEu67kFDFixCyzh_q4JZBtlCGT8o3mbMSuWkvQi6mY7Td1Zg>
    <xmx:AJi0Y3S5NuqdR3Sb7_xc28stzxso6-dsEnv5S3XCP07RGgA6Btwf0A>
    <xmx:AJi0Y2KuX059OQLVvgIf-H15Qo4IkUSXrCzViYyA9VsyOt5Bs8HCxA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 16:02:56 -0500 (EST)
Date: Tue, 3 Jan 2023 15:02:55 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: aspeed: bletchley: Update Bletchley
 devicetree
Message-ID: <Y7SX/6bsztulhw7/@heinlein.taila677.ts.net>
References: <20221226054535.2836110-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UVVO6PfiOY+k50jH"
Content-Disposition: inline
In-Reply-To: <20221226054535.2836110-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--UVVO6PfiOY+k50jH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 26, 2022 at 01:45:33PM +0800, Potin Lai wrote:
> Update Bletchley BMC devicetree.
>=20
> Potin Lai (2):
>   ARM: dts: aspeed: bletchley: rename flash1 label
>   ARM: dts: aspeed: bletchley: enable wdtrst1

Series is

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

>=20
>  arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> --=20
> 2.31.1
>=20

--=20
Patrick Williams

--UVVO6PfiOY+k50jH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmO0l/8ACgkQqwNHzC0A
wRnGEw/9GLCKw18/9q0D6SO1hROCCBqvYbyo4jUuPidxkMqJEe4Zl5/b4mh4qpqK
iDABYd4KO+tpTE2AAA2m0Z8LKuUcORzPOcXFuVQ8xZTVidjO1DDDx/YJGEU40/bI
MgEX7MCK02p99OAHOs1ycdRMkf4/dSv59x++ArFP4ngC6+Qxe81Y27gZUKk3kpK1
yVeCTeBpjNTgKdjaGdwymCTbD19VWYAs2+OaJS/GGsvGnIPNozFUb3jlXl7HdaU9
MgGsSpd7B4FHN+l2EDDPboqznpekOJfsSAd0bEnMoIcIShnng+0p9mGbL3+AI6Cr
iGkG1jkLJoXhS51WJp3RvOnNRJsU/+NxndYLPBOi0WoG1CSKWrUG0XroM2JSgOZN
fQLVe+Qkk70kgtUduB1Hf26ew6uhcZXFFMBRCGYBGeDKFz040LSsDNxexDm9AHkK
DjNgrPhXfgUhvqJkKf3RlA17qI6QVdXlMMt1IDc623vewSSgz/+itrz0nQ8i2TnN
zzipth+eN3ulI/CSi5I6BhdGhSIFVBq3VnWEC/32RwhJcbJSYZJp1JqPGkS3kr1D
gjIgRy6taxKzxZxlSTjaaiGr7P+YeZkvAZZmGkbSnx5mkJv4z5G1c2/LKpKMXljP
3cAHZ8XlasHm5xmzswRFz8QQqBnNiHwLT4jGuhfFky1niI84F4M=
=03aC
-----END PGP SIGNATURE-----

--UVVO6PfiOY+k50jH--
