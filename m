Return-Path: <linux-aspeed+bounces-3757-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPx1CAqowmkyggQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3757-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Mar 2026 16:04:42 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E33317A7E
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Mar 2026 16:04:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fgCxf3CS1z2ynP;
	Wed, 25 Mar 2026 02:04:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::133" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774364678;
	cv=pass; b=mBFBlJQ5IMdP1SyoX0prNEVN4wRdFLfx2DfALHdGlOTyfHxrkhSyXKJ29yb8/SAKrunlqrmYnSomB2GhDYT/nnNpA/RXHW54z4yzm5cheXXsjcxY9zITs/m/xnKL1PCRQW98PrdR0dUj/dRfzrkjOIaGtX9HfS2uGusAaRB0zYBf1YNt7Sm3Sl1TEZ44lBEJymKm92nrc8Uj2vNrS61AyWrtM34q2pIzok6cv/skTsJLguQSQHdFdBUbkHAuwFOntg8xhpeu6jUoCwKghCVGG7bvqUiHaFJ/CdxAnmniu3MFfSf0NJou5KfKrboXCJRgh/rGvssu0G8yi2RL0A0OPw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774364678; c=relaxed/relaxed;
	bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pi/8+1rPY+XvDZ7zod7G9YtbN0e6FSIMbznAmptaDqmwcAR0KAnEIRBrRhBhy18uwUbZteM0+848cQUq/3XiKN7AB++1XvBOQfojEInv/e8VZG8w+0cWn6qzdhJQqogyuBbkDtwMgYQ2uhX6fGi/6q1Pwn32SSpVkIL6jrxkg1UcB9yf2gt7ZOuulA6DKnn8LFWq8n5iAvbW3+8L67CEjAjwuG4U06a9oJeyEotZTmPVzhfStCWKw76t654XjvYO6qPyPQ2pqi8cpcqM7rpfduzsZMFK37s/4voDOkGHmUYFswZy58EXu3rWiF00nINoz8gLpJHQ8PeAP/aUHw47ew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UmRpkGBZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UmRpkGBZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fgCxc5jkfz2yj3
	for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Mar 2026 02:04:35 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5a133b686f7so1544582e87.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Mar 2026 08:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364670; cv=none;
        d=google.com; s=arc-20240605;
        b=SRwycGsFbZNJoUphQhZ1/MTt/rc/0VCedoV8fLipTpM+bRSI5dWk4gtDofFiUotnTv
         ImDRcA1H2t+3lieNN1K9Tt7MV+1+GFphjeuuZPgtWt8DfEDSnadgsye61PNPOUzQygl2
         Zsyi9jJXqggsEY/NR2rJAXpfV0C04JV68eWdOg2O4JpaQoqUd2GMI1Q5XddjrKsS/XRx
         04GI08KWxCd4N2WZEhQirHNGbDB2ZJzQli2sZnzOiPQdWz1wiZnDzb7Gxy2rwcXQR9I5
         T0TAlv5Kirld+er8jQXQ/9RP5itgm6L9kf9mDPvInmmzqXttCPCyeTYdDGAhcAHyi/cq
         ET+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        fh=rmZWZZqsRLeB+YVYMhUmivy+8AugUkwNET2atqO2zY8=;
        b=jYCwNjF89WAGAfrwhpkc4yY60mKfLGtzTFS3n1/9il0caoR/N8JKg2wIaz2Pddqg0F
         02zMlDI/pWjZsAoLdMd/S1gSrKvIsdr0t4ee3plGS71DT5d2k/buyYV79tSh6nE5QLBf
         mE2ZMkYLh7Xa2L3yQBEmSk4SVoUhrWGX9Uv/qxVPXZ9KWXyIhniWuoAlAdwzb7ZdRh54
         x3XV2K8VgmvfP0c3DInIIcFFCgcs9jBX3SDwrRUFm4y/+28D3pVQVzQkH95gHKvoFW/U
         HmHDhc8u4sKSpqbKV8/9aEHb58ucrZZwSVFYC3djUKBTEGZb+TwzF7LJPp9A+RiMBzxA
         V6ng==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774364670; x=1774969470; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        b=UmRpkGBZCrMoOnte2ssfGrUyzBdH06mjCh3OeysoTfX2/FdilVfbYlpyZOQ7dCi/1N
         IjzkVMkzM5d2FuuZ567SF8DIY6ecLP/rBU4664iQ8Mm7lmtWbXwD9jTmqDEXpSXPvuGW
         j+W37qk4ibPyOcAzMN0ssUa14Yb5v4UOr6hbZzYDGsrZz8O5CtqNjDJ13VUb0T/bBlAp
         z3L2MLBILDfvbmCKfdPySTbyQGxUc8W0of2tZEqhG/lCh4YxPDiOKZ3eSCtVDYvNoYL/
         guwi+onJHobW0HmEM90vIncSLnvokiMChMqcFhMnyiOhg21o+3TJ564scM2nxKTbRrha
         0O/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364670; x=1774969470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        b=BpB/d8zlrr9nuoxgqUu1XhPer2olx7YdR0YeKOs/NQzKW8da+qOjCxNvG+mrqtvAZ1
         1yLJL8Nc7n68yM+j5m2c/ULbxC9qw37BdDmBc9WoeE6Y6m9ebeY6OUKUR2b2228YsE1B
         eWbrbqIqGe4hlisOw3N3LSKlw/7+3wb9awhMQgHWRqlxRtvAT/daemZL5+euXWCntq3x
         HsoktgFfDIZjq3TVhUit7wp/0Z5IqL3X7nTg+Pk5e3BoETcOt/v/myb7MYZqwVVusUZL
         HuAyW6OlGXNbWE2Q+88a/2qtYaC5kfbtahqgNE2+3g3zTNbl+dT8Wp7ledlL/ps8GYlK
         WGxg==
X-Forwarded-Encrypted: i=1; AJvYcCVP0QMHUXWRPB6uaN6p/zMGcxTHeDSJjUhy4fox3UbqlfGSLR0+HLOKMwohvGXoGNVO/pWAg5OfuiH7NoM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJ5zyu1AMDnfHPW8jvcBCiIfdz1T/uSBxhEETflGryBGeYDa9x
	Z7Lhk7qPJJcxAcWLaS2leH1RXUsQTtHmN0J9RwYEV5gWTIF9zDDT99wbEBhLnMvRv6NG8DyRNs0
	+nDKg8uj2kLWLfs8AMTir7jOB/w1v+1eQkkS8zTF+0g==
X-Gm-Gg: ATEYQzzRyrsM9yQSXXJWVeyJ+MedL62Pj3wAJcFFF4iwHUz9lOBreoyY7dP4+mrP2U0
	LfFWGCR4m4u4GvKPmx2Y/0zqkqorTGL83SbYkCsTRTgslJvkHhIWm2GsOXWLqWQdgcUcdQRg9Jc
	/eacdAcuSN32XHRRh5rE9aqj4QnD7RDvJSBlrYJBX2Sykf52G01L25EYUUFqujo/psHV8N2nUEX
	vuErmSx7j4Cuu66evexYLePgUGGOyUGz96SA5CjzEjDOicETQAKZN3NqIwmxw/05fA1eDnWUCMF
	zSRYqCXD
X-Received: by 2002:a05:6512:15a9:b0:5a2:7d84:6a44 with SMTP id
 2adb3069b0e04-5a285ae4b8dmr5600779e87.6.1774364670294; Tue, 24 Mar 2026
 08:04:30 -0700 (PDT)
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
References: <20260324-sdhci-v4-0-c8c2060ccb5c@aspeedtech.com>
In-Reply-To: <20260324-sdhci-v4-0-c8c2060ccb5c@aspeedtech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 16:03:54 +0100
X-Gm-Features: AQROBzDGb2O61nTd0QV3ZdTm6lrh7bdMvQHr7qGN2e1GOEsGjRP5W0BZL_IWEd0
Message-ID: <CAPDyKFqwCahQCw7kB495Ym1JmSkn0PAkXVn==oV9_pKcb9zj9w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add AST2700 support for aspeed sdhci
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3757-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ulf.hansson@linaro.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:ryan_chen@aspeedtech.com,m:andrew@codeconstruct.com.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:ryanchen.aspeed@gmail.com,m:adrian.hunter@intel.com,m:p.zabel@pengutronix.de,m:andrew@aj.id.au,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:ryanchenaspeed@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,kernel.org,jms.id.au,gmail.com,intel.com,pengutronix.de,aj.id.au,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,aspeedtech.com:email]
X-Rspamd-Queue-Id: 13E33317A7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 02:58, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>
> This series add aspeed sdhci support for AST2700. The AST2700 sdhci
> requires an reset. This series updates the binding and driver to
> support reset requirements.
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v4:
> - 2/2 rebase git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
>   next branch fix the conflit.
> - Link to v3: https://lore.kernel.org/r/20260323-sdhci-v3-0-93555b8f6411@aspeedtech.com
>

The series applied for next, thanks!

[...]

Kind regards
Uffe

