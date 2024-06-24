Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EA09579C3
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKT1rB0z7CBR
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GF9nWhMx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=noname.nuno@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W717C59tfz30Vr
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 18:18:15 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3651ee582cfso2159855f8f.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 01:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719217093; x=1719821893; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=je7iVUYucuoeYQLpqSsqzD6r2n/1GXf0qdUuHS7ILWI=;
        b=GF9nWhMxA95nT4Yozne6j4OzLZMrHKcXwUBWL2J/UVGD3DATtnDgBXnPS1FaIDm/bt
         5jFYA43gxqmKdNow2kccJ78QtSeoML2oaTyh0PJbXt8EyHv7oG/X+0ao2ZekZFROuMoY
         GNXzOgLSeouTg6q60BdIidedzu2DNcgjgIxaUZo3BUfK5HOOfTE1s5nFW0TaU3OKzviR
         cgvKesM7LJ3CbKI3OJqjOFfzAd4AbfLkusnnEYdyleU8HqmD7vlIbZTVYtO5RGwtPQTm
         KyDydBQTGf6xkqGyCDkKH9c+0vBtb5Lu7T9R0c4fLaGKZ4OqNIBfrMAZQyeeqKBKAYZK
         tUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217093; x=1719821893;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=je7iVUYucuoeYQLpqSsqzD6r2n/1GXf0qdUuHS7ILWI=;
        b=hXXXPdCGq7U0QlKXrbbBlLtAY17kinPvk3YFn/6xZEh5nn3cnyTFEWFJjWqbVCgVnj
         awIRREsRNdZtltlTv2KddoXLUVIAexXU0ZcBq4KnZifSbQFoeU3hF48lB6BLV1Wk4oND
         1IHlSCY2xAL40Rtdte3Sp5j4Zg+mMobZQm7Js/itM14eg3Tli99eRRXR+Swk5x9yQGPh
         iGVwvTrxTr7fiu/Un9GX53EIR8SAP6LDApXOb9yTBYcjDtkKYO//99TAFDXJm2Whe1ry
         o5nQJVAcCKqJz55oi3+coQRUVmWoAzFj/Om+sszr6dM7RDhpVRQbcaJqUuQ3Fqi6oTtn
         1Nlg==
X-Forwarded-Encrypted: i=1; AJvYcCVAI1ggXiB6ZD53DN6HjRIW+5jokuJlAhdOaGwzQIQjn3yT9Dub7EZv1sfSV1+pWUx5dTwKi1Gc39WiU5fpnuNf/VT9xeTDwxvDHRpF/w==
X-Gm-Message-State: AOJu0Yy2rl/19kXc7AFYxUt+m9sNgPpSefZflZbTqrpuckZJ0fxiaPYp
	+bdR/5Oy4f7EW/ySjnKmVGxi0vFbHaeaOkxN1kpbC3krnKFpNFNx
X-Google-Smtp-Source: AGHT+IHnGYFexaKtfHeEI03foXMgcT/aayb9uK1oNmGi+t02VUhnUy5Mats+3Z7yrA54ooboVT9PcQ==
X-Received: by 2002:a5d:6544:0:b0:360:9a8a:5f02 with SMTP id ffacd0b85a97d-366e9629557mr2709718f8f.58.1719217092782;
        Mon, 24 Jun 2024 01:18:12 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6? ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366388c3d57sm9306718f8f.35.2024.06.24.01.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:18:12 -0700 (PDT)
Message-ID: <d95fee6fe2da5f4fb068f83975b383b1ba0b9bf0.camel@gmail.com>
Subject: Re: [PATCH 10/10] iio: dac: ad3552r: use
 devm_regulator_get_enable_read_voltage()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>
Date: Mon, 24 Jun 2024 10:18:12 +0200
In-Reply-To: <20240621-iio-regulator-refactor-round-2-v1-10-49e50cd0b99a@baylibre.com>
References: 	<20240621-iio-regulator-refactor-round-2-v1-0-49e50cd0b99a@baylibre.com>
	 <20240621-iio-regulator-refactor-round-2-v1-10-49e50cd0b99a@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
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
Cc: linux-aspeed@lists.ozlabs.org, Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, Andreas Klinger <ak@it-klinger.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-06-21 at 17:11 -0500, David Lechner wrote:
> Use devm_regulator_get_enable_read_voltage() to simplify the code.
> Error message is slightly changed since there is only one error return
> now.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>


