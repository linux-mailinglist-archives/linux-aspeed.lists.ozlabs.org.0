Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A554992940
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 12:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMb7N0HgBz2yst
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Oct 2024 21:32:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728297134;
	cv=none; b=AofgOnrpFeZo+vq8sbKLTmMWnCWD/tlfv9LUT4WZ+StjPEQLCY/5/FiYboB2y5S/bmaJ7/KIK15tKH4+sAZFAgu/EsK5c2tV2diTp+E1tKGZ/j49wydcWNsaXnFTZB+wVmv1aJbeZDva7qNkU+hybIWe2/RInODzQnghq31Pq5X+csIKKrXT6FPwHPM9jm4eOrx7/+JmaKfG6xX9ARNYvIzyuYd5yZuJCHDdoNtJUhvvOJ8K48X4PbBZOL0n8BkCYtBp5ZlUe4HKgPJk+nxIi6JmmvlvYT9XtqjtT+6+JFo/1rck+wu0vLFv86dupaLlHNovx2OeVKNfHV/6WyAjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728297134; c=relaxed/relaxed;
	bh=7LvHP5fo67hgb9VcVRv0wFxCNn8LjWM9uhRHbO3WbUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArjUqc6o1ZeYHCl5lHAtFGrW8huY+iNnPwEp5PBUcnRz4vCJutTHbDOvJELEzA9CpD6MU8EmvVj+3j9NKyrYw2dhFqA5IYVqnppOL5wg0oGUpZJjB3hDuFgPqUb0kFB+OCBGaX4kdoJrGkiGTswxA5Mv/Qdq8eEOpUl+3CnxEoT5kZ8XWj3zkZdMGfYj5PcCT50jachl3O5d4Vje9vf2ntqecSzWH+BA5ea5J9VHsrWDlrdvRGTlx2At/RACmQV4DU/qIqC8dhyHEpoMzA7JwKMoNDB+PUxbPG98rKAzeQ8R3dkagFpm/VyEfeX8/5iReMqrmjBBePPDWUYcWffafQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=UIW/+hbY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=UIW/+hbY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMb7K4B4xz2xjJ
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Oct 2024 21:32:13 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e09f67bc39so3531734a91.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Oct 2024 03:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1728297131; x=1728901931; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7LvHP5fo67hgb9VcVRv0wFxCNn8LjWM9uhRHbO3WbUo=;
        b=UIW/+hbYUtcI1ZKxC4Wn6r8FQ9l8a06TE1ng0u/qoPX9gGHpnftmoRV7WC4xaBLgmt
         sfPxblCpukWTbpTt57u8PXYbg2nXX2w13CAtpzCjY7TwZc71qNBRKmsnLMGLPAP7Euka
         YxL4guqx1Bmi4Kd/ASSWE9YCRTOH3gqtZVcqSZfuqkEExnDbGb2Rkm3F4WjpOw0jObbI
         3r6VfnhlHRiFH8DVArzqLcQDKnJEIBlvw91DFvQetlfSQaYi+L6k3Pm5DZVMAnJh/aUA
         F6MqNZKlTV8rnoTC625A6KHz61Z1vjQ/A+6ZP9/Pi8rUOOg+EvNSMC93iLaC+MPE7lzE
         tzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728297131; x=1728901931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LvHP5fo67hgb9VcVRv0wFxCNn8LjWM9uhRHbO3WbUo=;
        b=gIuKB2AfCBTmr+z6NzayRqQsfoahdm3319EkJdWHdj9Jg80cyI3EFQspqJbPUSAe4w
         z/6n4YIBzXUKfo0RQhkkTtIASE/OcnWCPf0AyVnk4d9SEafDWJpi71mNzeFYbFgvH/qD
         /zwpkXy2N1FP1aFTE/5lWn6BW8Gfi3yfFdE1qt9WAkoi8t8LEy+0Am56os2xWXG6juPb
         WYkVGzWllufcTDsYuXKa/jaJHbwAlAAhOvokNbmh049Q0UvmJATNSE5SUSXXvovWcUxN
         EFW+Z5NWIeaL7ZucuVUjrCB/Zm5RINwaocuR/5hUXdpTqbYeauCiDKQby/eqe119F2LS
         /t2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNyn4OALn7ckQjJd/s3SiOu+uPj+8J4vnI+f7/Bl0gvmNfuXoZcNtDaAoZ9a9kf3vab0+j8Y3Dt3H/fW0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3d3ZYTlp4mgu7o2CJcBLgpcPY+8nH4cQsrUH85ONs1dFwpwYK
	LT7wVBzbUgKMaqgi0xk5e4q6tJ+gpgOREBAb5yNlW9nzmt5fBnLG94yZQFRoUd6LTCXPqi2P5nJ
	zojvTnn6ZpkqGDV8ZKmrMGMJ8f+euJmbYxG+DUw==
X-Google-Smtp-Source: AGHT+IFTY63/DLU3Wj2tdaOKPpjw15exbuhnusAMK03pLzADjpWiknDc5KMRIELZ+sDZO65UzW0pNLJlWGwyqrOMhuc=
X-Received: by 2002:a17:90a:8a91:b0:2e0:80e8:a319 with SMTP id
 98e67ed59e1d1-2e1e63bf55dmr12819746a91.34.1728297130812; Mon, 07 Oct 2024
 03:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241002084023.467383-1-naresh.solanki@9elements.com> <xuczpa6nrxjwo7hjn62ehblnzc5twupghbg4uuwp5vfczw3gmg@x23yhbxjccpy>
In-Reply-To: <xuczpa6nrxjwo7hjn62ehblnzc5twupghbg4uuwp5vfczw3gmg@x23yhbxjccpy>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Mon, 7 Oct 2024 16:02:00 +0530
Message-ID: <CABqG17gbXGRBDHzt8-rt6_n+37oMhjmJGxCLEqqM48GjMrKNrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof

On Thu, 3 Oct 2024 at 13:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Oct 02, 2024 at 02:10:17PM +0530, Naresh Solanki wrote:
> > Document the new compatibles used on IBM SBP1.
> >
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > index 95113df178cc..8c04d6eaec08 100644
> > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > @@ -89,6 +89,7 @@ properties:
> >                - ibm,everest-bmc
> >                - ibm,rainier-bmc
> >                - ibm,system1-bmc
> > +              - ibm,sbp1-bmc
>
> Keep alphabetical order.
Sure. Will update in next patchset. Will also include Ack-by for the patch.

Thanks.
Naresh
>
> Best regards,
> Krzysztof
>
