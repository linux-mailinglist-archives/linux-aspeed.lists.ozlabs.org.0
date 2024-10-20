Return-Path: <linux-aspeed+bounces-1-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D857E9A52D6
	for <lists+linux-aspeed@lfdr.de>; Sun, 20 Oct 2024 08:09:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWShT1jB8z2xxx;
	Sun, 20 Oct 2024 17:09:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729404585;
	cv=none; b=ZcejzrSOWMv2E/cXO5xHRn6INYbVM/09+RiBMV+kg6Q4Nm1uOD51fy0NIdaARnKQQekgO7tPROOfXxW5mgiXsPVZxvq0bV9NSdX2Ht6/ynIWzMJR2fA3AjXT2wnZ5u8Bd+88LiKx7FcbliSDiKZqFg4OdeTq6TybFkWP2TSSSjJ2541kh+/Uqun7/9mAR+WGorjdqQ9Q5D99YVr9Ur1k4XND840VzwtZ/fDae4dlTN5EevIw0+fL4BObkBX/YW0e97Kxrqk4hbIjrhColYHflBMOG9//QDVt4WAZ6sadAnylPZFQ2ps5NDER04ZNuC2gdUOd/X/uC5i81Uh3NSmVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729404585; c=relaxed/relaxed;
	bh=PTXMKktRU1kHd1v8ez4l/wEld672DY8iqhd8CdFxkzw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=LDFQ4WgYRDXsIorASeN7Dy+ei3T8zPaShfW/4mGugheIx3U5u6pbtZ3e4+QXRSE6WSKxxtXaUXvUBhNfHnGo8g09IY5zaQAoraplF8k5SpaTkT2H5zrgB+olbUPNU2eRf8vJong3/4FbysdV5RBgaQ+KMexV6JDjyLVBTVfHS2X6zz+XFpr5UViso74ahaxoGMlNFJSSdVwqnixho20c+SuKd3VrYq/DSuhHMchd1i+NtkNHD9TR2nb3x3fotlITaoztgHQVB3ZmS1QSCyYKl82wSx5ERPY9g0yCi2o7YKNdHWG5spD9OBJO0NyBCqmWz23PVPB4iqzVGUTYC9COiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=MJQfK8+E; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=MJQfK8+E;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWShM5hQJz2xZK
	for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Oct 2024 17:09:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729404571;
	bh=PTXMKktRU1kHd1v8ez4l/wEld672DY8iqhd8CdFxkzw=;
	h=Date:From:To:Subject:From;
	b=MJQfK8+EdWSBs3SGXpoMfrVO1FhJC+Bh1qvms6wmPNDtKNH8kFwKg0rgy/Lg3NfDt
	 uhm9WUtEOwH6z3CHkGdkdp2WRi7KMb4GtWKb+Mtk5vw+QA/Qx+1jMt2Lx/RRAvdux0
	 +bXOQnUC86aDAWUqTMpTpqCduEmKhnXlMIVBlsbdqL+JUtcBMXnlRJgP+/b2rUWSit
	 1xU76JJW9i30G1lwNWkaeY7lxozBedDMVoCO8oK6ORJt0R9mkjKVYqOKrJ0MZz9Sn8
	 uWNVE+HUs0vQKGrjNJJG4hI31Utebmm/Qi4f6CcJESY0x9BBgtwb5KOMcKwCFaG2w6
	 l0ya5lQ62xhwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XWShC517hz4wbp
	for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Oct 2024 17:09:31 +1100 (AEDT)
Date: Sun, 20 Oct 2024 17:09:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: <linux-aspeed@lists.ozlabs.org>
Subject: Change to this list
Message-ID: <20241020170931.29476c0e@canb.auug.org.au>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q5gDsEDeafFUhC2qWc4k66j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/q5gDsEDeafFUhC2qWc4k66j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just to let you know that this list is now managed using Mlmmj rather
than Mailman.  To see how to manage your subscription, please send an
email to <linux-aspeed+help@lists.ozlabs.org>, or see
https://lists.ozlabs.org.  The archives are still available at
http://lists.ozlabs.org/pipermail/linux-aspeed .

--=20
Cheers,
Stephen Rothwell

--Sig_/q5gDsEDeafFUhC2qWc4k66j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcUnpsACgkQAVBC80lX
0GwQBgf+OdlxNXxpLPZYeWn26unZmucXp2QdWYlSuM6GyywJ5MkOHfwiCcQGYRxO
QAku20xmuwuQSqE7BP2KPsWgN8kxDCoY9yLxY0H7jKPDnNNcvsZPonwvNohcGg4/
V8jkPfVtt5oxnuvQCVTaaJJ/KQlAVw+iWSjxlhVW/sddM1857FfshORML6tWFMEv
MttPTUPxx5jIGGaUzH31zHsCco+j66+XublDSAbBKxRxzqACNXnYpGvJ20xy8yle
CY//SSvNyu5lkfjrkfNv1VPRuaZAtaz3kwwwiN1ldlXD1wz+l/8YFfWNSb6nABgn
sd/ALIHg7coguO9nE4edIXIC1fJ6eQ==
=svX9
-----END PGP SIGNATURE-----

--Sig_/q5gDsEDeafFUhC2qWc4k66j--

