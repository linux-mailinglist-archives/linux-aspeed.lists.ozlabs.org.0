Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD41247C344
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Dec 2021 16:44:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJLNP15KXz2ywn
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Dec 2021 02:44:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=DhHhd+KT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=nUeJlLCc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=DhHhd+KT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=nUeJlLCc; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJLNB3SVbz2xBx
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Dec 2021 02:43:53 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C411A32007BE;
 Tue, 21 Dec 2021 10:43:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 21 Dec 2021 10:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=m87v0MiJXQ0AYj9J0oYwIBg3htz
 mOL4yODzPrK1faxo=; b=DhHhd+KTg89y/ElZQyf/JblypvTFCxblsyT0FwOWh0C
 DFLCfq2NQSAV/YWoGengVqG4FK1Yli3uyOVOhDm7aDMSa0AbtC0LgcCVR2JNFr+8
 8VPYmrv83E2dtQ6UW9NlVhtzAw0QdAY9FH5CATN1x43VlmkRMTSrXycCpt324VYq
 4PwrtElB5GHaum4a3bZwe9eUcA6SLG2kUeoUC+06iG+B6sVOS32m8SBGmK8qIDW3
 YVchBKlshK1HI9M7xCinF4hlLNoN35qLJ61mOOjNBzef7BNfwEA6bRnxZcftfSmS
 Fo7vNUXr5IkvVkWe8jnnDQXxoTXv7w6/u8LkuW77P1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=m87v0M
 iJXQ0AYj9J0oYwIBg3htzmOL4yODzPrK1faxo=; b=nUeJlLCcJ4LL0E2BzTOUKn
 s5xBGjo9kbChietQozgooF+RRtz6hO+MY0ETTSfh77gVW6GY3jn5dNf/2wIrsAQ5
 MgxhGSyVEFFjuY2uHKN7xPb8Werh//4vlnufwmAEQSb1XqfqrkA2UVLpiAWfhXLN
 a/lqEnMj6ZAmHQPr1ECRO3LNWmqWAai62UrHRRsoeVgSJxdMtqHSIhXTjXqIIAq3
 W2K17lUL4Wq5h2pKW+SsYIqgscr5gIb1pkIZMGGhYxznvu93F9UGBeq8MYQQZ3WE
 AMgG5U6tD0O1vYQNZw7UcJOcDarvxG/2u3GKp0vvYqvLEzduOU4ze0/d2zfkojnQ
 ==
X-ME-Sender: <xms:MvbBYa5qCcNVQIHEuOncCQGWrAJInObd9nNXgJuylDkWzNixyJ_OpQ>
 <xme:MvbBYT7cOAUDgviUN7A7z5moTBaKrfMwDkZHnKTu9uHicJxP4u0tCpZijN6Oqev0v
 -TQqUwM2jQU8wl8tjE>
X-ME-Received: <xmr:MvbBYZfSnRMnHofZP4WbgQwuipIPH4ckldNCNgfePVd3__bV6wNMSC2tcCFuI6-F9Q0rqdcizgNpBB5x-cBSOAzdNKXhd6qo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtgedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:MvbBYXLAfX85ZXBgHoQD6yr5GfObCv5QEBuo3AkXFaiUPOeZfUyQ-Q>
 <xmx:MvbBYeIgzcRVY2jMYVpLhYgqYx0cfj2K2sy272aq8Yl6SXeHiWM88w>
 <xmx:MvbBYYyoIOSYQTv67lvvGNwT8S_PHxD_Uk5wGtRHO0g8pfnAXSrISg>
 <xmx:NPbBYd-O0noIj5jhq8LbVaoMvsZx1RmyUILgmIKdKNhiCbVActrJag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Dec 2021 10:43:46 -0500 (EST)
Date: Tue, 21 Dec 2021 09:43:45 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v8] ARM: dts: aspeed: Adding Facebook Bletchley BMC
Message-ID: <YcH2MSByPLAvw5mI@heinlein>
References: <20211207094923.422422-1-howard.chiu@quantatw.com>
 <CACPK8XddhFn3PreJM3D=djkREgqGD7yZhS7YoqxxXsNfhZpLhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HM0gOAIGGoJB3tSG"
Content-Disposition: inline
In-Reply-To: <CACPK8XddhFn3PreJM3D=djkREgqGD7yZhS7YoqxxXsNfhZpLhQ@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Howard Chiu <howard10703049@gmail.com>,
 Potin Lai =?utf-8?B?KOiztOafj+W7tyk=?= <Potin.Lai@quantatw.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Howard Chiu <howard.chiu@quantatw.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--HM0gOAIGGoJB3tSG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 04:37:55AM +0000, Joel Stanley wrote:
> Hi Patrick,
>=20
> On Tue, 7 Dec 2021 at 09:52, Howard Chiu <howard10703049@gmail.com> wrote:
> >
> > Initial introduction of Facebook Bletchley equipped with
> > Aspeed 2600 BMC SoC.
> >
> > Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
>=20
> Are you ok for this one to go in for v5.17?

Yes.

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

Would also appreciate if you could apply to your Aspeed tree for OpenBMC.

--=20
Patrick Williams

--HM0gOAIGGoJB3tSG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHB9i8ACgkQqwNHzC0A
wRkTXQ/+KMROyY3iAc3pg9nNuSF7rxqc8a1K7gZ+4SHFwwvD49PMhiywWiR8qqs/
ehvUMImlcjIfTGAizpi1zlWwH87GOxqLnLwJ4IfFaiC895ho20SJWTaazksu6/SV
qdjHOOkvBScfGfftQoq4/G4ty1rNUlLl1O2AuXoDaLGZali9TbupFcQqd8qOKYAp
MaVEQck3YPd5Tj3PGQSpVnuUvZL77qvjoIgaeR9Pdoj02O4rTZZXcHsckGi0doDD
ZmZA4Xt4COqT+VDXrc0I5UsGvhYtlzCJ8V+nt6lRbQ+Kc0klIhTt5/iZ04HmKzsO
y5gw/CgBTSkvd/6aHYvXTyby4uSzSvrJn5GHH40aG8FA4z2BDst+C0Y64Q+2xc0j
ZNkq2HWsNYlHJsEhlSwDwglh8otlJn/+czYcuHkiDuylrXItuRS8O0C+sfxhE9l9
dCpVfLKM/idXbyIMTK5Ya8Q1cfRHsarpNHsBH7bYm/FuuNJHu9OBojTfE5F60ia2
qwSLf3O6V8UpDMKJM/ntItNh3B5X9HjjsTpfiVqV7fLb0MpwiA7KmY/AGcqs7sPJ
kKODFplbuJKI7CHzzzGdXwDZruXaWUOaiEB4WjGUjCSBYhWNRjaCafvRjNYmMciW
YEWrOcPSfV2A8BHqv6NjRMgBCOSkCUTA3veNYPNT89GFPIukAnI=
=izBI
-----END PGP SIGNATURE-----

--HM0gOAIGGoJB3tSG--
