Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 016079579C1
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKS5sK6z3g5H
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dsshsg3O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=noname.nuno@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W713g0xY3z30TC
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 18:15:09 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4217dbeb4caso34170385e9.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 01:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719216898; x=1719821698; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hRYREobyvCAzKtt5mW5IeCI5gt9AaSc20gWQ/83QMEc=;
        b=dsshsg3OUU9WWuoJNG+kvPYSvYOzE6ZJBtr72ZaCe92AvuMxa8vwqF0bpx8IWWSGdt
         hxgJIXQgtxgciyM6SeCjGr3tUelDqwvD2UBrOOOzAh2atMc4l4Noz8tvofKkaL6Woty9
         HcwhG7G8YsUVVitzD5NJ9vWqmm9qctoVNUB7ItMuMxul0J8GJm8Et7FBokGN/NshhhIk
         FZDz1sbNi67vI4dd7iaOgxXsZFUJy5WzDaj0F2l4N3EUl+CeC5gdStjnApVhDsWdR8KO
         tI+QOHnsmTl3fedRFpK5DWOIyildpn2nCkdOk0Cpox4URPCr4cf3xGVpDqbvlAGQU5DD
         qAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216898; x=1719821698;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRYREobyvCAzKtt5mW5IeCI5gt9AaSc20gWQ/83QMEc=;
        b=hGVjhot6VTb9Ea8+eAiNyzx7dKKuqGUjSTYo/V6LXXUr76xObwu/XPl721Usr0dbLM
         0oO9tDTmhEyVa/WXpKG1xDekCIKCD9oHHPKzA4L75S0JubIK9QQn/pJVY6ChBBCLWran
         atfAbOdLmgcHPrRug/EVhYpH/hV6hUvcdOH3pAKRZTpltq80CRbP77is72fh894jTjqK
         Zes7sRXvCk/qhJQukb4GzWeQQJhex8ySBuw7AXYEaFYASjL3HuD8LIiRyzVhEd/WoXyC
         8TbrS1eKSuCcIn1Laa4Ts3D7ejlhlbAhBRN9/y3OUTB9wXPgIXceaHuW4o54V6SXZJ7j
         1o+g==
X-Forwarded-Encrypted: i=1; AJvYcCXOjok08avlD6IfFMCIzEWrAxzKElhL2mDCPk07cZJcQ5YGI6rkYknTwhq0JhRzMc5LEaW2Qeq8nQMGu1NbyjUJ3VWUy1cDab4z7Z30og==
X-Gm-Message-State: AOJu0Yw6PFC/90T4EIyDRW8XO9GV47/L2mfTf7ZK1rAhsXVwFqN0FNpH
	CuI6euktXFYYT4u/s/53VIK57+GtSwmLo/Fw0stOmohtBsOdMB2n
X-Google-Smtp-Source: AGHT+IEy1X+hOUJiHqA3ecZ6Ii0x22b6sHG9btRiBLKNsIPVxvEr2exgOHADZY6aAn5A9lmQazxFtA==
X-Received: by 2002:a05:600c:4c23:b0:421:7e6b:1b75 with SMTP id 5b1f17b1804b1-4248cc343a7mr27420295e9.17.1719216897914;
        Mon, 24 Jun 2024 01:14:57 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6? ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248191c65asm124398485e9.40.2024.06.24.01.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:14:57 -0700 (PDT)
Message-ID: <e3b23dc323a0ca01f3e47dde10406c81062f544c.camel@gmail.com>
Subject: Re: [PATCH 05/10] iio: adc: ltc2309: use
 devm_regulator_get_enable_read_voltage()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>
Date: Mon, 24 Jun 2024 10:14:57 +0200
In-Reply-To: <20240621-iio-regulator-refactor-round-2-v1-5-49e50cd0b99a@baylibre.com>
References: 	<20240621-iio-regulator-refactor-round-2-v1-0-49e50cd0b99a@baylibre.com>
	 <20240621-iio-regulator-refactor-round-2-v1-5-49e50cd0b99a@baylibre.com>
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
> Error message is changed since there is only one error return now.
> LTC2309_INTERNAL_REF_MV macro is added to make the internal reference
> voltage value self-documenting.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>


