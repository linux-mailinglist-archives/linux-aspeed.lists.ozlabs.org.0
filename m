Return-Path: <linux-aspeed+bounces-2449-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0CCBDB8D7
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Oct 2025 00:04:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmSt61HH0z2yGM;
	Wed, 15 Oct 2025 09:04:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760479454;
	cv=none; b=VBIHSrGZ7g6E8NVwp7XsUXQIqoeUHT+wTGZrvY8mKiTuQ0bxplqnRkC7O3+IUgY53rPVZi7DcmSXiV3UCqatQ4fAEkStFvDTlJOX9bbI4KA12yDL8LmMXOxFJfq5r0yB5VGq3et2GGYQMpdU6AV2xW81eOBV+hWgR8pAvrw6STTZ0FaxoCG+jBrDdiSv3sTT0YD7Wzk1Np4NQPS6Cp7UxsEoe9by/hlTyc8p1+puyBxll2wv3GHbYsIqm/GXK+udZanL7SIKW+7FAQyewOFUOqHAbI9RPBWZSPK5DGQVP+RExMmDk1S2IZWfppxHxKOrfcEfgk7SuU3q7ByzNgVG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760479454; c=relaxed/relaxed;
	bh=3ib1iU3Qxw19Ut1WEzRnfFFufKNvW6qoaUWizLUq11Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PsJ/PL73BvqAQjtQE6bs3o8JvzQJ5PakSxnYPA/YpJkb/Yoj+MqCdX6y3pUjv1u0pE8pVztvTnQTwWEFi2ReK6dzpU/z6MBB2KTNr2W8sDINH3gjf9lgmNaFkwCXZ3u2nOE8wLb6FqnWgFMTz7K6dhuOWI5zq6xnWxCT1Aav9wWJfI+1OkjEPiVvsNzLLURJeUcSNAQ1NCIQ1/5SlewHwM+EyPSfFPT1sCWR7H/0V9swsuqKijpXZSsRSTo33l+DquvyXlbrLcsLAGZtVXSMmgcSSvnCZvpVDRR4R64omPCHsD0cX9wxeXI3mix9MHn5pSUiEIv1qD88q4UPo2JkWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RFfXKzkL; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RFfXKzkL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmSt51W63z2xdg
	for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Oct 2025 09:04:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760479451;
	bh=3ib1iU3Qxw19Ut1WEzRnfFFufKNvW6qoaUWizLUq11Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RFfXKzkLQtwUueDyCrkSuazpG44SGbxqEHdEVqA6yRD7EsZxBZcdlMsE+zAhISIeA
	 2pxWVSQWI3POKOY1yaS+c0Zmq0hVWF0BVwVLUcSKkuOjxEo4du64sz0+3f8eqc8ppV
	 9AFbkGKLp8TAGcRnlg29Nb57Ax2cf4tly1tUNCp6wHzoTby0gn4Zc5FM/9vfsm7t1l
	 za6awf81wSsV/ZXamUjdMf98iKiPeYBa1IdjJn5R+9qgvbk0a4e15gdnLjv+wr8NEP
	 BrwCGW/HlU/YsqccXVvyIqWJGK/d6eOLB3gkZ+g9cXYT/o+uTQNdCQAnSpo6UrGbI1
	 0uj+NvXVHyfuA==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 974387699E;
	Wed, 15 Oct 2025 06:04:09 +0800 (AWST)
Message-ID: <b387257937922d62fbf6bf6377470cfa8a46da2f.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: ipmi: Convert aspeed,ast2400-ibt-bmc to DT
 schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Corey Minyard
 <corey@minyard.net>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 15 Oct 2025 08:34:05 +1030
In-Reply-To: <20251014152948.3782738-1-robh@kernel.org>
References: <20251014152948.3782738-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-10-14 at 10:29 -0500, Rob Herring (Arm) wrote:
> Convert the aspeed,ast2400-ibt-bmc binding to DT schema format. It's a
> straight-forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks Rob.

