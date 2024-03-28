Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD7688FAE6
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 10:15:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lQWtoEzo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4yYn6CNtz3vZY
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 20:15:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lQWtoEzo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4yYh2KfHz3cRd
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 20:15:19 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso704611276.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 02:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711617316; x=1712222116; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK3WWLpghCazhNxnzpVoeZ6lBHInJGjDV4FWurbpgm0=;
        b=lQWtoEzoGMnYwaSg8arTvt5x8utpanevB5ab5WdKapltwE9HI+air0DXF/Lb+oGE5f
         +7HfDmXAK51gMn5kb9bSqPlpkI+7ZhqZKhFE1/vHaN5W3ilZl3OGJ9GXTbbw3MbRnyGv
         ejOIDL0suYfOetvTOQgRBHy0hCe13zWjDpPf6aWi8E9txPgnkt4M9vHgW9Q8xoFbg0C4
         Yxs2e3cDYhm6mS15u+r61RNQxBfi0lfRhZY8qfenqv10b3RgQBvK57MGhknwHhiTHReK
         OxSM31YeeKikJN8+Kxki+rH7ivtPNBtPYEcWh/mV1rUrvHzA4SG+SkdKoNkLBBzg1jNf
         sdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617316; x=1712222116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DK3WWLpghCazhNxnzpVoeZ6lBHInJGjDV4FWurbpgm0=;
        b=CpgEILfiQ6FMMJsjEF2NKha0CJxh8IA1A7Ok0m6W08oU+F9smuMdSSIMhmdwJ9pq+M
         NhBUvfW9VozIfRDpFt3J0u5ZKToGU2OIPNVxn7k/6TNWnQzJLKC+pkHq3vPoNnPh5vXA
         0tFFJjjyIIXmdYDYOz24Q1haCPciB004910ltdfnwp9CDABxq20j3wOH303+ppKJbz2j
         sXcFV/9OB5QWe4V/miIrARlGaw2dNtvDwvdx4XlTafbD4Ba8YOvJsNcPDBe3DW5GLdji
         7gOFKkZbBC119BYGk9F1v2A2SHmrDQmJJQweeN0KLcWnwElOdxu2MBqagJCOsJlDMLdQ
         Dw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsQKX1InZz/3iCt+E4YlSp/uo+P1idozBoRp7+utiT+W75gHP49LvLVVMeIrG1hYJTeRBj+qYmu8B1i47TmLiXqegoLwzPRheoh7YoQA==
X-Gm-Message-State: AOJu0YwBoErMCEuFWQVFEaQMDGVQ6mNIZAPvGTtWq9FGQp74o/38BUx6
	VOCsdIaJQJG5XwphI3JVvLv//Vg//G4E7BKgXJyEBKajLw2sTRvnuVbYRR9aWT5nqk2grkPym50
	Js8KyQce+ScTj+j7Hcv4ohu956kmnzA4ynWcPuw==
X-Google-Smtp-Source: AGHT+IG4UAVC7NGDGidRJtRNWZfYlG/8nA0Xwk+zw0p4efi6wDiAGEzLWglCyWj8gtQ9WRg5ukXUl7W+4wfTKJP4AgI=
X-Received: by 2002:a25:9b85:0:b0:dd0:39a0:a998 with SMTP id
 v5-20020a259b85000000b00dd039a0a998mr2199704ybo.6.1711617316176; Thu, 28 Mar
 2024 02:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240313092809.2596644-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20240313092809.2596644-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:15:05 +0100
Message-ID: <CACRpkdaxekb_E4ttW5XfRUa+srkjOzUaVXRAtHMYjkVir7R7xQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: pinctrl-aspeed-g6: Fix register offset for
 pinconf of GPIOR-T
To: Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: BMC-SW@aspeedtech.com, johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, Ricky_CX_Wu@wiwynn.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 13, 2024 at 10:28=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> The register offset to disable the internal pull-down of GPIOR~T is 0x630
> instead of 0x620, as specified in the Ast2600 datasheet v15
> The datasheet can download from the official Aspeed website.
>
> Fixes: 15711ba6ff19 ("pinctrl: aspeed-g6: Add AST2600 pinconf support")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied.
I recorded Delphine's similar patch as "reported-by".

Yours,
Linus Walleij
