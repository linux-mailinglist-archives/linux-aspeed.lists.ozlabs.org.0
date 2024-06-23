Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60444913A78
	for <lists+linux-aspeed@lfdr.de>; Sun, 23 Jun 2024 14:22:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lbzh9hb8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6VbB1njMz3cX5
	for <lists+linux-aspeed@lfdr.de>; Sun, 23 Jun 2024 22:22:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lbzh9hb8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6Vb425RGz30VJ
	for <linux-aspeed@lists.ozlabs.org>; Sun, 23 Jun 2024 22:22:06 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3645e9839b3so2570619f8f.3
        for <linux-aspeed@lists.ozlabs.org>; Sun, 23 Jun 2024 05:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719145318; x=1719750118; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgre2tmf9SXFj2cqbgPVUjh3Eed5VaGUQC0zWeY+boU=;
        b=lbzh9hb8C+7+jBvq0bDqzbMOlXDmiAxQ4dgr/OHrFKUe+rcm96mJOKayLtKrUagP10
         qdfzhP2Icw2rUVd040fl5VjPkecaqjSwUfAPY969nIj/z14FVJUcMpTmk0aPXop+Fwq2
         4Xp2Uhkdc9WzF9Ozs7VzCVoUZD1RSUV6PeYpPbLpfxEK/voeCDBjGXodyt6OVYDGWzIL
         v/ucRaza0injgDU/HlebLhsRBde/GwDP+TUjgT1WP2UTCg8iczMNepfhr5vWQUPo7jd5
         QxuoPNEezWHP6kXv9bTw7rpPeCimuxt5sZIYtXbr+q+THAfV9c95dcC0mBOIwTR6oKqw
         twCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719145318; x=1719750118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgre2tmf9SXFj2cqbgPVUjh3Eed5VaGUQC0zWeY+boU=;
        b=q0ChG5RqO2wvcktiWPbUxtmVE4A4fRzU7w45om/gLiOeA2nRxexEq/GCOfyCYKRQEW
         m8vMS5LdYHH1fNSNF1B0UvjnzEv9s6ea+GtboIKGjeiC6ljy4QLUf+R1BHnBLdT796Ng
         orKxbYw/Y+VBdojUB2/YtQ51miECceMX0dFJZ7sCV4CApsb+eXY03NImQ7Z5pq2JEGkm
         wcP5K4dc78nb6C4G7CnVAtpaQV/rJ07SfHAMF0rJ/jdFlv6ysyEexmpgzG4fc85Ln8+U
         K6yc4dHUj50JeBPUNLSLUF1ClaXRBAbos50LmYmvR8ZLyeix7kA0JrPqbKmU7hFCv3LM
         NNdg==
X-Forwarded-Encrypted: i=1; AJvYcCW2+lRcxw43N8vV2ge7mj3/DZYJCF5J7KYxePCuH2W8Id8wjJnaU/IZ5zHrqVM5+ndBTCW3VP9ZoTTHc1W7I5gWKP2lja4lh0zIzfOW+w==
X-Gm-Message-State: AOJu0YzFHBAKJ+lMe/0yW7gC3EMXShZHz2H9gKsQ9EAjCnKKZbQJpezA
	rM1xHypfFjW+5BJDNUbYUaQ8VF6rYhcFwH7rAS2Pd3OdrU8xivex9lkIR8Rdpf8=
X-Google-Smtp-Source: AGHT+IFkOrybExCXqw1aas/OIA9pf7OdMxt3VXdHbfkpFMy1QVq0N03E8F8aFd71i2/Z+mUXEfAJ0Q==
X-Received: by 2002:adf:fd87:0:b0:360:81d2:b06b with SMTP id ffacd0b85a97d-366e79fdfbcmr1251813f8f.18.1719145317888;
        Sun, 23 Jun 2024 05:21:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f693fsm7197553f8f.69.2024.06.23.05.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 05:21:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH] arm: dts: aspeed: Use standard 'i2c' bus node name
Date: Sun, 23 Jun 2024 14:21:51 +0200
Message-ID: <171914524817.46635.13681344434936708370.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531193115.3814887-1-robh@kernel.org>
References: <20240531193115.3814887-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Fri, 31 May 2024 14:31:14 -0500, Rob Herring (Arm) wrote:
> The standard node name for I2C buses is 'i2c'.
> 
> 

This one is waiting for 3 weeks and I think it wasn't applied. Let me know if
someone else should take it instead.

Applied, thanks!

[1/1] arm: dts: aspeed: Use standard 'i2c' bus node name
      https://git.kernel.org/krzk/linux-dt/c/11afaf16a6540754d618179bd01791fc03480146

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
