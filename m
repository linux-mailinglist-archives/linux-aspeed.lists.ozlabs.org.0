Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDEA9579AF
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKP1qwjz7Bwk
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=LDD7UNML;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=866fceb69=conor.dooley@microchip.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 23 May 2024 19:45:37 AEST
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlNZn4JFZz3vfy;
	Thu, 23 May 2024 19:45:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1716457538; x=1747993538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3RNmpj8T/J28ZcWAgo+2/2V0jteUzgAQkIp6zBV7eJM=;
  b=LDD7UNMLeva7yEWNbc9A2jWIgiaupEWu/PFiQWJRx7PlzesWB0nLbfvI
   XX9+W20uVuoBjMmLZSQYxFRcE77fLJx4gh4+XjtzsR4slnYsNZumXsszJ
   E+tHypxxVupCCasHGuFOPixSulLYSbaoaR9mAkqYArloEaxN9W9yPzmJU
   AZDA3xVnNl6yy62tMJ2xPrPlIHkbhxEG/HrAAu8JmXKDz8G3n2gjciF75
   JEYG1Kcqtqerlobt2gXkfqzX0H9gtCi+eylJI9e2SMlzh9qMdD/MXjSnf
   hDko7j5QuAuLA2R/AlMzcF8m3+ELiTiUPCxtujPQi6HfWA2Gk4yFEAYJ9
   Q==;
X-CSE-ConnectionGUID: yai/vSIxQIKneP+ylDCdoQ==
X-CSE-MsgGUID: RMkYCa1QSMe+7TL0BWgdFg==
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="asc'?scan'208";a="256727518"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 May 2024 02:44:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 23 May 2024 02:43:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:43:44 -0700
Date: Thu, 23 May 2024 10:43:26 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v6 03/20] dt-bindings: fsi: Document the IBM SCOM engine
Message-ID: <20240523-armband-utopia-66892e08b90d@wendy>
References: <20240522192524.3286237-4-eajames@linux.ibm.com>
 <bee0888c-f81b-46c8-8a1c-802d108dc0c0@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KslNXwyxSH4K/mBw"
Content-Disposition: inline
In-Reply-To: <bee0888c-f81b-46c8-8a1c-802d108dc0c0@web.de>
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org, Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--KslNXwyxSH4K/mBw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 11:28:13AM +0200, Markus Elfring wrote:
> > The SCOM engine provides an interface to the POWER processor PIB
> > (Pervasive Interconnect Bus).
>=20
> Please improve this change description with a corresponding imperative wo=
rding.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.9#n94

The tense used here is fine.

--KslNXwyxSH4K/mBw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk8PvgAKCRB4tDGHoIJi
0o7ZAP90vhT9+l0wZYf/DL2M8yWdcRsTVggSwuamCo1DKQsfTwD/aE/ubCJjEmqQ
/DEArNwqFRhNcUQASKgsVIujbbwvCwU=
=Y394
-----END PGP SIGNATURE-----

--KslNXwyxSH4K/mBw--
