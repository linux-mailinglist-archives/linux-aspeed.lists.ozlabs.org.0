Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AB46B840D
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 22:38:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb94p72Ynz3cFn
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Mar 2023 08:38:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oBqnejAr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oBqnejAr;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb94h0W9Gz3bT1
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Mar 2023 08:38:10 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-53d277c1834so267030447b3.10
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Mar 2023 14:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MoCrv9jwtexNbM0NP+aK8vItTXphA3RLnXqGbEpBLs=;
        b=oBqnejAr+cRAwqwSDggHbvyESDCGAm0IT2diFdiMbosVlO5Ebuhv06xmTVl9Mh/HiC
         neV3kaLcXxQXZ8rWMN8gaBnTm1Qs4vHbNOBsKiKclKcZXxdswwbW7rBFUKdItfCnI55B
         2ciaYsFh+G7t/+4hYcljFYbfjyaEpP3SMr2C9qEUP/kIQsFIHhlZF56rBM4WUzFRQ661
         MMseawNEKdVEkMrE+QDWzPun/jDHPZLOHsF0+5oWgZmpKX/eGOmxBPDExhV/iJDyeQ53
         7MDPKM5XS+1UdJ2cwhsUmyEm2WnUYeGW2PETZiXrAbRMWy1JxeNHHzOrvI5hsaoqnfPl
         S05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MoCrv9jwtexNbM0NP+aK8vItTXphA3RLnXqGbEpBLs=;
        b=NB+HNFAzxCXMRugfK0MIpG4fNO0TVpxFEUqH9hi2YOkrdeMSx+dv30mp0KN217Jt2c
         +YSxcRzxsjlbQrvq3GiwAWnWKxKV4+pte99yf6/ex3S4oRtskWULHAPdDbeUH/shknSP
         wZS35tCCURJLZVqUle/eHi46SVCmHaLkCUoZ4J6c18vz1RPG6WaXWZyZmkKeBemVzJYN
         HNdNY4u1JyLq7/fNQxVaY7Spj6AtG0R1jkb9OBcgm0jCTASH7DctRuWgqKJEB7x3tfRl
         PuxXr23h0GRF9qm1h3vKYm8j27d91mGP/weeelfl0Cq61eQ6AAFg55sOCytrSoYZJCE4
         wh7Q==
X-Gm-Message-State: AO0yUKVbmM+wlAf4QKEK6WXbS6A2U28ZfFpHAANKI9nqJnZb3TPkIHEx
	R6b5Lplq5MMCKTtFucir7IOFhMdcUwQdy9u/E2rzsQ==
X-Google-Smtp-Source: AK7set8L1lXLBOk8wvAHM9wRqKPNXWlxKrtxI+qzt+FALwwKZEBkTpnXYO0qQldUzFZLmRJDWTgYnC/ZzTNl4HJfoug=
X-Received: by 2002:a81:ae04:0:b0:534:d71f:14e6 with SMTP id
 m4-20020a81ae04000000b00534d71f14e6mr5550337ywh.9.1678743487766; Mon, 13 Mar
 2023 14:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:37:56 +0100
Message-ID: <CACRpkdZngHNjW0=ZtnjvNV=rfR8tip_iqTE-FDWY+ggsU6DCmw@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] drm/dma-helper: Add dedicated fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, maarten.lankhorst@linux.intel.com, javierm@redhat.com, mripard@kernel.org, linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, daniel@ffwll.ch, linux-amlogic@lists.infradead.org, airlied@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Mar 13, 2023 at 4:51=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Tested with fbcon and IGT on vc4.

Also tested on the U8500 MCDE on Samsung GT-I8190 (Golden)
successfully.

Yours,
Linus Walleij
